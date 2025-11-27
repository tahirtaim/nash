<?php

namespace App\Http\Controllers\Payment;

use Stripe\Stripe;
use App\Models\Order;
use Stripe\PaymentIntent;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class StripePaymentController extends Controller
{
    public function index()
    {
        return view('backend.layouts.stripe.stripe'); // blade view
    }

    // Create PaymentIntent
    public function createPaymentIntent(Request $request)
    {

        $order = Order::find($request->order_id);

        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        Stripe::setApiKey(env('STRIPE_SECRET'));

        $intent = PaymentIntent::create([
            'amount' => (int) ($order->total_amount * 100), // Convert to cents
            'currency' => 'usd',
            'payment_method_types' => ['card'],
        ]);

        return response()->json([
            'clientSecret' => $intent->client_secret,
        ]);
    }

    // (Optional) Confirm payment if needed from backend
    public function confirmPayment(Request $request)
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        $paymentIntent = PaymentIntent::retrieve($request->payment_intent_id);
        $paymentIntent->confirm();

        return response()->json($paymentIntent);
    }
}
