<?php

namespace App\Http\Controllers\Api;

use Exception;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Inventory;
use App\Traits\ApiResponse;
use App\Models\AdminSetting;
use Illuminate\Http\Request;
use App\Models\OrderItemDetail;
use App\Services\HesabeService;
use App\Models\OrderBillingInfo;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    use ApiResponse;
    public function store(Request $request, HesabeService $hesabe)
    {
        $validator = Validator::make($request->all(), [
            'name'              => 'required',
            'email'             => 'required|email',
            'phone'             => 'required',
            'address'           => 'required',
            'town'              => 'required',
            'state'             => 'required',
            'zipcode'           => 'required',
            'payment_method'    => 'required|string|in:cod,hesabe',
            'promo_code'        => 'nullable|string|exists:promo_codes,code',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Validation Error', 422);
        }

        // 1. Calculate Order Totals (Backend Security)
        $cartItems = Cart::with(['product', 'offer'])->where('user_id', Auth::id())->get();

        if ($cartItems->isEmpty()) {
            return $this->error([], 'Cart is empty', 400);
        }

        $subTotal = 0;
        foreach ($cartItems as $item) {
            if ($item->p_type == 'offer') {
                $price = $item->offer ? $item->offer->final_price : 0;
            } else {
                $product = $item->product;
                if ($product) {
                    $price = $product->discount_price > 0 ? $product->discount_price : $product->regular_price;
                } else {
                    $price = 0;
                }
            }
            // Cart table doesn't have quantity for individual rows (it's 1 per row), 
            // but if you have a quantity column, multiply here. 
            // Based on previous code, it seems 1 row = 1 item.
            $subTotal += $price;
        }

        // Delivery Charge
        $setting = AdminSetting::first(); // Assuming single setting row
        $deliveryCharge = $setting ? $setting->delivery_charge : 0;

        // Promo Code Discount
        $discount = 0;
        $promoCodeId = null;
        if ($request->promo_code) {
            $promo = \App\Models\PromoCode::where('code', $request->promo_code)
                ->where('status', 1)
                ->first();

            if ($promo) {
                // Validate expiry, usage, min order amount
                $isValid = true;
                if ($promo->expires_at && $promo->expires_at->isPast()) $isValid = false;
                if ($promo->min_order_amount && $subTotal < $promo->min_order_amount) $isValid = false;
                // Add more checks if needed (max users, etc)

                if ($isValid) {
                    $promoCodeId = $promo->id;
                    if ($promo->type == 'fixed') {
                        $discount = $promo->value;
                    } elseif ($promo->type == 'percentage') {
                        $discount = ($subTotal * $promo->value) / 100;
                    }
                }
            }
        }

        $totalAmount = ($subTotal + $deliveryCharge) - $discount;
        if ($totalAmount < 0) $totalAmount = 0;


        // Lock settings for order number
        $setting = AdminSetting::lockForUpdate()->first();
        $order_number = is_null($setting->last_order_number)
            ? $setting->invoice_number
            : $setting->last_order_number + 1;


        DB::beginTransaction();
        try {
            // Create order
            $order = Order::create([
                'user_id'        => Auth::id(),
                'order_number'   => $order_number,
                'payment_method' => $request->payment_method,
                'sub_total'      => $subTotal,
                'shipping_cost'  => $deliveryCharge,
                'total_amount'   => $totalAmount,
                'promo_code'     => $promoCodeId, // Storing ID or Code? DB schema says integer usually for ID, but request had string. Let's assume ID or handle accordingly.
                // If promo_code column is string, store code: $request->promo_code
                // If it's integer (foreign key), store $promoCodeId. 
                // Checking previous code: 'promo_code' => $request->promo_code (which was nullable).
                // Let's store the code string for now to match previous behavior, or ID if you prefer.
                // Reverting to request code to be safe with existing schema unless confirmed.
                'promo_code'     => $request->promo_code, 
                'discount_amount'=> $discount, // If you have this column
                'placed_at'      => now(),
                'is_paid'        => false,
                'payment_status' => 'pending',
            ]);

            // Billing Info
            OrderBillingInfo::create([
                'order_id' => $order->id,
                'name'     => $request->name,
                'email'    => $request->email,
                'phone'    => $request->phone,
                'address'  => $request->address,
                'town'     => $request->town,
                'state'    => $request->state,
                'zipcode'  => $request->zipcode,
            ]);

            // Group items to calculate quantity (Logic from previous refactor)
            $groupedCart = $cartItems->groupBy(function ($item) {
                $id = $item->p_type == 'offer' ? $item->offer_id : $item->product_id;
                return $id . '-' . ($item->p_type ?? 'product');
            });

            foreach ($groupedCart as $group) {
                $firstItem = $group->first();
                $quantity = $group->count();
                $type = $firstItem->p_type ?? 'product';
                $itemId = $type == 'offer' ? $firstItem->offer_id : $firstItem->product_id;

                if ($type == 'offer') {
                    $offer = \App\Models\Offer::with('products')->find($itemId);
                    if (!$offer) throw new Exception('Offer not found ID: ' . $itemId);
                    
                    // Check inventory for all products in offer
                    foreach ($offer->products as $product) {
                            $inventory = Inventory::where('product_id', $product->id)->first();
                            if (!$inventory || $quantity > $inventory->quantity) {
                                throw new Exception('Product out of stock in offer: ' . $product->product_name);
                            }
                    }

                    OrderItemDetail::create([
                        'order_id'   => $order->id,
                        'offer_id'   => $itemId,
                        'quantity'   => $quantity,
                    ]);

                    // Decrement inventory (Only for COD or if we reserve for Hesabe too? 
                    // Previous code: COD decrements immediately. Hesabe did NOT decrement in store().
                    // Let's keep that logic: Decrement ONLY if COD.
                    if ($request->payment_method === 'cod') {
                        foreach ($offer->products as $product) {
                                $inventory = Inventory::where('product_id', $product->id)->first();
                                $inventory->decrement('quantity', $quantity);
                        }
                    }

                } else {
                    $inventory = Inventory::where('product_id', $itemId)->first();
                    if (!$inventory) throw new Exception('Inventory not found for product ID: ' . $itemId);
                    if ($quantity > $inventory->quantity) throw new Exception('Product quantity out of stock for product ID: ' . $itemId);

                    OrderItemDetail::create([
                        'order_id'   => $order->id,
                        'product_id' => $itemId,
                        'quantity'   => $quantity,
                    ]);

                    if ($request->payment_method === 'cod') {
                        $inventory->decrement('quantity', $quantity);
                    }
                }
            }

            DB::commit();
            $setting->last_order_number = $order_number;
            $setting->save();

            // Handle Response based on Payment Method
            if ($request->payment_method === 'hesabe') {
                // Send Hesabe payload
                $payload = [
                    'amount' => number_format((float)$totalAmount, 3, '.', ''),
                    'currency' => 'KWD',
                    'responseUrl' => route('hesabe.callback'),
                    'failureUrl'  => route('hesabe.failed'),
                    'orderReferenceNumber' => (string) $order_number,
                    'cardType' => (string) $request->card_type, // Ensure this is passed if needed
                    'paymentType' => (string) $request->paymentType, // Ensure this is passed if needed
                ];

                $response = $hesabe->createCheckout($payload);
                
                // Clear cart after generating payment link? 
                // Usually we wait for success, but previous code cleared it. 
                // Let's clear it to avoid double ordering.
                Cart::where('user_id', Auth::id())->delete();

                return $this->success([
                    'payment_url'   => $response['payment_url'],
                    'order_id'      => $order->id,
                    'order_number'  => $order_number,
                ], 'Proceed to payment', 201);
            } else {
                // COD
                Cart::where('user_id', Auth::id())->delete();
                return response()->json([
                    'success' => true,
                    'message' => 'Order placed successfully.',
                    'redirect_url' => route('cash.order.popup'),
                ]);
            }

        } catch (Exception $e) {
            DB::rollBack();
            return $this->error([], 'Server Error: ' . $e->getMessage(), 500);
        }
    }

    // public function store(Request $request)
    // {
    //     // dd($request->all());
    //     // Validate incoming data
    //     $validatedData = $request->validate([
    //         'name' => 'required|string',
    //         'email' => 'required|email',
    //         'phone' => 'required|string',
    //         'address' => 'required|string',
    //         'town' => 'required|string',
    //         'state' => 'required|string',
    //         'zipcode' => 'required|string',
    //         'cart' => 'required|array',
    //         'cart.*.product_id' => 'required|integer',
    //         'cart.*.quantity' => 'required|integer|min:1',
    //         'promo_code' => 'nullable|integer',
    //         'subtotal' => 'required|numeric',
    //         'charge' => 'required|numeric',
    //         'total' => 'required|numeric',
    //         'payment_method' => 'required|string|in:hesabe',
    //         'payment_type' => 'required|integer',
    //         'card_type' => 'required|string|in:knet,visa,master,amex',
    //         'cardNumber' => 'nullable|string',
    //         'expiryDate' => 'nullable|string',
    //         'cvv' => 'nullable|string',
    //         'knetPin' => 'nullable|string',
    //     ]);


    //     // Prepare the payload for Hesabe API
    //     $payload = [
    //         'name' => $validatedData['name'],
    //         'email' => $validatedData['email'],
    //         'phone' => $validatedData['phone'],
    //         'address' => $validatedData['address'],
    //         'town' => $validatedData['town'],
    //         'state' => $validatedData['state'],
    //         'zipcode' => $validatedData['zipcode'],
    //         'cart' => $validatedData['cart'],
    //         'promo_code' => $validatedData['promo_code'] ?? null,
    //         'subtotal' => $validatedData['subtotal'],
    //         'charge' => $validatedData['charge'],
    //         'total' => $validatedData['total'],
    //         'payment_method' => $validatedData['payment_method'],
    //         'payment_type' => $validatedData['payment_type'],
    //         'card_type' => $validatedData['card_type'],
    //         'cardNumber' => $validatedData['cardNumber'] ?? null,
    //         'expiryDate' => $validatedData['expiryDate'] ?? null,
    //         'cvv' => $validatedData['cvv'] ?? null,
    //         'knetPin' => $validatedData['knetPin'] ?? null,
    //         "amount" => $request->total,
    //         "responseUrl" => route('hesabe.callback'),
    //         "failureUrl" => route('hesabe.failed'),
    //     ];

    //     // Send the payment request to Hesabe API
    //     $hesabeService = new HesabeService();
    //     try {
    //         $response = $hesabeService->createCheckout($payload);

    //         // Redirect user to the payment URL
    //         return redirect($response['payment_url']);
    //     } catch (\Exception $e) {
    //         return redirect()->route('hesabe.failed')->with('error', $e->getMessage());
    //     }
    // }




    public function orderHistory(Request $request)
    {
        $orders = Order::with('items.product', 'billing')
            ->where('user_id', Auth::guard('api')->id())
            ->get();


        $data = $orders->map(function ($order) {
            return [
                'id' => $order->id,
                'order_number' => $order->order_number,
                'total_amount' => $order->total_amount,
                'status' => $order->status,
                'items' => $order->items->map(function ($item) {
                    if ($item->offer_id) {
                        return [
                            'offer_id' => $item->offer_id,
                            'name' => $item->offer->offer_name,
                            'thumbnail' => asset($item->offer->image),
                            'type' => 'offer',
                        ];
                    }
                    return [
                        'product_id' => $item->product_id,
                        'name' => $item->product->product_name,
                        'thumbnail' => $item->product->product_image,
                        'weight_unit' => $item->product->weight_unit,
                        'weight' => $item->product->weight,
                        'type' => 'product',
                    ];
                }),
                'billing' => [
                    'name' => $order->billing->name,
                    'email' => $order->billing->email,
                    'phone' => $order->billing->phone,
                    'address' => $order->billing->address,
                    'town' => $order->billing->town,
                    'state' => $order->billing->state,
                    'zipcode' => $order->billing->zipcode,
                ],
            ];
        });

        return $this->success($data, 'Order history', 200);
    }
}
