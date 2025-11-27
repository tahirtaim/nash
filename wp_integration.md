# WhatsApp Integration Guide for Nash Project

This guide provides step-by-step instructions to integrate WhatsApp notifications for new orders using either **Twilio** or **Meta Cloud API**. Choose one method.

---

## Option 1: Twilio API for WhatsApp (Recommended for Reliability)

### Step 1: Install Twilio SDK
Run the following command in your project terminal:
```bash
composer require twilio/sdk
```

### Step 2: Configure Environment Variables
Add these lines to your `.env` file:
```env
TWILIO_SID="your_twilio_sid"
TWILIO_AUTH_TOKEN="your_twilio_auth_token"
TWILIO_WHATSAPP_FROM="whatsapp:+14155238886"  # Your Twilio WhatsApp Sandbox or Sender Number
ADMIN_WHATSAPP_NUMBER="whatsapp:+96512345678" # The admin number to receive notifications
```

### Step 3: Create the Service Class
Create a new file `app/Services/TwilioWhatsAppService.php` and paste this code:

```php
<?php

namespace App\Services;

use Twilio\Rest\Client;
use Illuminate\Support\Facades\Log;

class TwilioWhatsAppService
{
    protected $client;
    protected $from;

    public function __construct()
    {
        $this->client = new Client(env('TWILIO_SID'), env('TWILIO_AUTH_TOKEN'));
        $this->from = env('TWILIO_WHATSAPP_FROM');
    }

    public function sendOrderNotification($order)
    {
        try {
            $to = env('ADMIN_WHATSAPP_NUMBER'); // Send to Admin
            // Or send to user: $to = "whatsapp:" . $order->phone; 

            $message = "📦 *New Order Received!*\n\n";
            $message .= "Order #: *" . $order->order_number . "*\n";
            $message .= "Customer: " . $order->name . "\n";
            $message .= "Total: " . $order->total_amount . " KWD\n";
            $message .= "Payment: " . strtoupper($order->payment_method) . "\n\n";
            $message .= "Please check the dashboard for details.";

            $this->client->messages->create($to, [
                'from' => $this->from,
                'body' => $message
            ]);

            Log::info("WhatsApp notification sent for Order #{$order->id}");
            return true;
        } catch (\Exception $e) {
            Log::error("Twilio WhatsApp Error: " . $e->getMessage());
            return false;
        }
    }
}
```

### Step 4: Update OrderController
Open `app/Http/Controllers/Api/OrderController.php`.

1. Import the service at the top:
   ```php
   use App\Services\TwilioWhatsAppService;
   ```

2. Inject and use it in the `store` method. 
   Find the line where the order is successfully created (around line 170 for COD and line 280 for Hesabe success callback).

   **Example for COD (inside `store` method, after `DB::commit()`):**
   ```php
   // ... existing code ...
   DB::commit();

   // --- WhatsApp Notification Start ---
   try {
       $whatsapp = new TwilioWhatsAppService();
       $whatsapp->sendOrderNotification($order);
   } catch (\Exception $e) {
       // Ignore notification errors to not block order flow
   }
   // --- WhatsApp Notification End ---

   return $this->success([
       'order_id' => $order->id,
       'order_number' => $order->order_number,
   ], 'Order placed successfully', 200);
   ```

---

## Option 2: Meta Cloud API (Direct Integration)

### Step 1: Configure Environment Variables
Add these lines to your `.env` file:
```env
META_WHATSAPP_TOKEN="your_permanent_access_token"
META_PHONE_ID="your_phone_number_id"
ADMIN_WHATSAPP_NUMBER="96512345678" # Admin number (no + sign, just country code and number)
```

### Step 2: Create the Service Class
Create a new file `app/Services/MetaWhatsAppService.php` and paste this code:

```php
<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class MetaWhatsAppService
{
    protected $token;
    protected $phoneId;
    protected $apiUrl;

    public function __construct()
    {
        $this->token = env('META_WHATSAPP_TOKEN');
        $this->phoneId = env('META_PHONE_ID');
        $this->apiUrl = "https://graph.facebook.com/v17.0/{$this->phoneId}/messages";
    }

    public function sendOrderNotification($order)
    {
        try {
            $to = env('ADMIN_WHATSAPP_NUMBER');

            $message = "📦 *New Order Received!*\n\n";
            $message .= "Order #: *" . $order->order_number . "*\n";
            $message .= "Customer: " . $order->name . "\n";
            $message .= "Total: " . $order->total_amount . " KWD\n";
            $message .= "Payment: " . strtoupper($order->payment_method);

            $response = Http::withToken($this->token)->post($this->apiUrl, [
                'messaging_product' => 'whatsapp',
                'to' => $to,
                'type' => 'text',
                'text' => [
                    'body' => $message
                ]
            ]);

            if ($response->successful()) {
                Log::info("Meta WhatsApp notification sent for Order #{$order->id}");
                return true;
            } else {
                Log::error("Meta WhatsApp Error: " . $response->body());
                return false;
            }
        } catch (\Exception $e) {
            Log::error("Meta WhatsApp Exception: " . $e->getMessage());
            return false;
        }
    }
}
```

### Step 3: Update OrderController
Open `app/Http/Controllers/Api/OrderController.php`.

1. Import the service at the top:
   ```php
   use App\Services\MetaWhatsAppService;
   ```

2. Use it in the `store` method (same placement as Twilio example):

   ```php
   // ... existing code ...
   DB::commit();

   // --- WhatsApp Notification Start ---
   try {
       $whatsapp = new MetaWhatsAppService();
       $whatsapp->sendOrderNotification($order);
   } catch (\Exception $e) {
       // Ignore errors
   }
   // --- WhatsApp Notification End ---

   return $this->success(...);
   ```
