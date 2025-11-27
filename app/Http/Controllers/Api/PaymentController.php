<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;

class PaymentController extends Controller
{
    public function processPayment(Request $request)
    {
        // Validate incoming data
        $request->validate([
            'cardNumber' => 'required|string',
            'expiryDate' => 'required|string',
            'cvv' => 'required|string',
            'amount' => 'required|numeric',
            'currency' => 'required|string',
        ]);
    
        // Prepare the payment data to send to the payment gateway
        $paymentData = [
            'cardNumber' => $request->cardNumber,
            'expiryDate' => $request->expiryDate,
            'cvv' => $request->cvv,
            'amount' => $request->amount,
            'currency' => $request->currency,
            'payment_method' => 'knet',
            'payment_type' => 2, // Assuming 2 means credit/debit card
            'knetPin' => $request->knetPin, // Optional field for KNET
        ];
    
        try {
            $response = Http::post('https://example.com/process-payment', $paymentData);
    
            // Log the full response for debugging
            Log::info('Payment Gateway Response:', [
                'status' => $response->status(),
                'response_body' => $response->body(),
                'response_json' => $response->json()
            ]);
    
            // Check if the response is successful
            if ($response->successful()) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Payment Successful',
                    'transactionId' => $response->json()['transactionId'],
                ]);
            } else {
                // Log the failure response details
                Log::error('Payment failed with response: ' . $response->body());
                return response()->json([
                    'status' => 'failure',
                    'message' => $response->json()['message'] ?? 'Payment failed',
                    'response' => $response->json(),
                ], 400);
            }
        } catch (\Exception $e) {
            // Log the error message and stack trace
            Log::error('Payment failed: ' . $e->getMessage());
            Log::error('Exception trace: ' . $e->getTraceAsString());
    
            return response()->json([
                'status' => 'failure',
                'message' => 'Payment processing failed. Please try again later.',
            ], 500);
        }
    }
    
    
}

