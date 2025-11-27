<?php

namespace App\Services;

use Hesabe\Payment\HesabeCrypt;
use Illuminate\Support\Facades\Http;

class HesabeService
{
    protected $merchantCode;
    protected $accessCode;
    protected $secretKey;
    protected $ivKey;
    protected $baseUrl;
    protected $version;

    public function __construct()
    {
        $this->merchantCode = env('HESABE_MERCHANT_CODE');
        $this->accessCode   = env('HESABE_ACCESS_CODE');
        $this->secretKey    = env('HESABE_SECRET_KEY');
        $this->ivKey        = env('HESABE_IV_KEY');
        $this->baseUrl      = env('HESABE_BASE_URL', 'https://sandbox.hesabe.com');
        $this->version      = env('HESABE_VERSION', '2.0');
    }

    public function createCheckout(array $payload)
    {
        // Build request array
        $request = array_filter([
            'merchantCode'         => $this->merchantCode,
            'amount'               => $payload['amount'],
            'paymentType'          => $payload['paymentType'],
            'currency'             => $payload['currency'] ?? 'KWD',
            // 'card_type'            => $payload['card_type'] ?? null,
            'responseUrl'          => $payload['responseUrl'],
            'failureUrl'           => $payload['failureUrl'],
            'version'              => $this->version,
            'orderReferenceNumber' => $payload['orderReferenceNumber'] ?? null,
        ] + ($payload['extra'] ?? []));

        // Encrypt request JSON
        $requestJson = json_encode($request);
        $encrypted = HesabeCrypt::encrypt($requestJson, $this->secretKey, $this->ivKey);

        if (!$encrypted) {
            throw new \Exception("Encryption failed — check secretKey or ivKey configuration.");
        }

        // Send to Hesabe Checkout API
        $checkoutUrl = rtrim($this->baseUrl, '/') . '/checkout';
        $resp = Http::withHeaders([
            'accessCode' => $this->accessCode,
            'Accept'     => 'application/json',
        ])->post($checkoutUrl, ['data' => $encrypted]);

        // Always try to decrypt (even if 422 or 400)
        $decrypted = HesabeCrypt::decrypt($resp->body(), $this->secretKey, $this->ivKey);

        if (!$decrypted) {
            throw new \Exception("Hesabe decrypt error: invalid response or incorrect keys.");
        }

        $json = json_decode($decrypted, true);

        // Check for logical or validation errors
        if (($json['status'] ?? 0) != 1) {
            throw new \Exception("Hesabe checkout error: " . ($json['responseMessage'] ?? json_encode($json)));
        }

        // Extract token from response
        $token = data_get($json, 'response.data.token')
            ?? data_get($json, 'response.data.paymentToken')
            ?? data_get($json, 'response.data');

        if (!$token) {
            throw new \Exception("Hesabe did not return a valid token. Raw: " . json_encode($json));
        }

        // Generate payment URL
        $paymentUrl = rtrim($this->baseUrl, '/') . '/payment?data=' . $token;

        return [
            'payment_url' => $paymentUrl,
            'token'       => $token,
            'raw'         => $json,
        ];
    }



    // public function createCheckout(array $payload)
    // {
    //     // Merge the common payload fields
    //     $request = array_merge([
    //         'merchantCode' => $this->merchantCode,
    //         'amount' => $payload['amount'],
    //         'paymentType' => $payload['paymentType'] ?? 0,
    //         'card_type' => $payload['card_type'] ?? null,
    //         'responseUrl' => $payload['responseUrl'],
    //         'failureUrl'  => $payload['failureUrl'],
    //         'version' => $this->version,
    //         'orderReferenceNumber' => $payload['orderReferenceNumber'] ?? null,
    //     ], $payload['extra'] ?? []);

    //     // Conditionally add card information based on payment method
    //     if ($payload['payment_method'] == 'hesabe') {
    //         if (in_array($payload['card_type'], ['visa', 'master', 'amex'])) {
    //             // Add Visa/MasterCard/Amex details
    //             $request['cardNumber'] = $payload['cardNumber'];
    //             $request['expiryDate'] = $payload['expiryDate'];
    //             $request['cvv'] = $payload['cvv'];
    //         } elseif ($payload['card_type'] == 'knet') {
    //             // Add KNET PIN if KNET is selected
    //             $request['knetPin'] = $payload['knetPin'];
    //         }
    //     }

    //     // Convert to JSON and encrypt
    //     $requestJson = json_encode($request);
    //     $encrypted = HesabeCrypt::encrypt($requestJson, $this->secretKey, $this->ivKey);

    //     // Send request to Hesabe API
    //     $checkoutUrl = rtrim($this->baseUrl, '/') . '/payment';
    //     $resp = Http::withHeaders([
    //         'accessCode' => $this->accessCode,
    //         'Accept' => 'application/json'
    //     ])->post($checkoutUrl, ['data' => $encrypted]);

    //     if (!$resp->ok()) {
    //         throw new \Exception("Hesabe checkout error: HTTP " . $resp->status() . " - " . $resp->body());
    //     }

    //     // Decrypt response
    //     $decrypted = HesabeCrypt::decrypt($resp->body(), $this->secretKey, $this->ivKey);
    //     if (!$decrypted) {
    //         throw new \Exception("Hesabe decrypt error: invalid response from Hesabe");
    //     }

    //     // Decode JSON response
    //     $json = json_decode($decrypted, true);
    //     $token = data_get($json, 'response.data');

    //     if (is_array($token)) {
    //         $token = data_get($token, 'token') ?? data_get($token, 'paymentToken') ?? data_get($token, 'data') ?? null;
    //     }

    //     if (!$token) {
    //         throw new \Exception("Hesabe did not return token. Raw response: " . json_encode($json));
    //     }

    //     // Generate the payment URL
    //     $paymentUrl = rtrim($this->baseUrl, '/') . '/payment?data=' . urlencode($token);

    //     return [
    //         'payment_url' => $paymentUrl,
    //         'token'       => $token,
    //         'raw'         => $json,
    //     ];
    // }
}
