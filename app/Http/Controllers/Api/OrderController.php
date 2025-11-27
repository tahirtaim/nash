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
            'cart'              => 'required|array',
            'cart.*.product_id' => 'required|integer|exists:products,id',
            'cart.*.quantity'   => 'required|integer|min:1',
            'subtotal'          => 'required|numeric',
            'charge'            => 'required|numeric',
            'total'             => 'required|numeric',
            'payment_method'    => 'required|string|in:cod,hesabe',
            'promo_code'        => 'nullable',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Validation Error', 422);
        }

        // Lock settings for order number
        $setting = AdminSetting::lockForUpdate()->first();
        $order_number = is_null($setting->last_order_number)
            ? $setting->invoice_number
            : $setting->last_order_number + 1;


        // ----------------------
        // Cash on Delivery Flow
        // ----------------------
        if ($request->payment_method === 'cod') {
            DB::beginTransaction();
            try {

                // Create order
                $order = Order::create([
                    'user_id'        => Auth::id(),
                    'order_number'   => $order_number,
                    'payment_method' => 'cod',
                    'sub_total'      => $request->subtotal,
                    'shipping_cost'  => $request->charge,
                    'total_amount'   => $request->total,
                    'promo_code'     => $request->promo_code,
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

                // Order Items & Inventory
                foreach ($request->cart as $item) {
                    $inventory = Inventory::where('product_id', $item['product_id'])->first();
                    if (!$inventory) {
                        DB::rollBack();
                        return $this->error([], 'Inventory not found for product ID: ' . $item['product_id'], 404);
                    }
                    if ($item['quantity'] > $inventory->quantity) {
                        DB::rollBack();
                        return $this->error([], 'Product quantity out of stock for product ID: ' . $item['product_id'], 409);
                    }

                    OrderItemDetail::create([
                        'order_id'   => $order->id,
                        'product_id' => $item['product_id'],
                        'quantity'   => $item['quantity'],
                    ]);

                    $inventory->decrement('quantity', $item['quantity']);
                }

                DB::commit();
                $setting->last_order_number = $order_number;
                $setting->save();

                // after commit cart delete 
                Cart::where('user_id', Auth::id())->delete();

                return response()->json([
                    'success' => true,
                    'message' => 'Order placed successfully.',
                    'redirect_url' => route('cash.order.popup'),
                ]);
            } catch (Exception $e) {
                DB::rollBack();

                return response()->json([
                    'success' => false,
                    'message' => 'Server Error: ' . $e->getMessage(),
                    'line' => $e->getLine(),
                    'file' => $e->getFile(),
                ], 500);
            }
        }

        // ----------------------
        // Hesabe Payment Flow
        // ----------------------


        if ($request->payment_method === 'hesabe') {
            DB::beginTransaction();
            try {
                // 1. Lock settings
                $setting = AdminSetting::lockForUpdate()->first();
                $order_number = is_null($setting->last_order_number)
                    ? $setting->invoice_number
                    : $setting->last_order_number + 1;



                // 2. Create order (do NOT decrement inventory yet)
                $order = Order::create([
                    'user_id'        => Auth::id(),
                    'order_number'   => $order_number,
                    'payment_method' => 'hesabe',
                    'sub_total'      => $request->subtotal,
                    'shipping_cost'  => $request->charge,
                    'total_amount'   => $request->total,
                    'promo_code'     => $request->promo_code,
                    'placed_at'      => now(),
                    'is_paid'        => false,
                    'payment_status' => 'pending',
                ]);

                // 3. Billing info
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

                // 4. Create order items (do NOT decrement inventory yet)
                foreach ($request->cart as $item) {
                    OrderItemDetail::create([
                        'order_id'   => $order->id,
                        'product_id' => $item['product_id'],
                        'quantity'   => $item['quantity'],
                    ]);
                }

                DB::commit();
                $setting->last_order_number = $order_number;
                $setting->save();

                // 5. Send Hesabe payload
                $payload = [
                    'amount' => number_format((float)$request->total, 3, '.', ''),
                    'currency' => 'KWD',
                    'responseUrl' => route('hesabe.callback'),
                    'failureUrl'  => route('hesabe.failed'),
                    'orderReferenceNumber' => (string) $order_number,
                    'cardType' => (string) $request->card_type,
                    'paymentType' => (string) $request->paymentType,
                ];


                $response = $hesabe->createCheckout($payload);


                return $this->success([
                    'payment_url'   => $response['payment_url'],
                    'order_id'      => $order->id,
                    'order_number'  => $order_number,
                ], 'Proceed to payment', 201);
            } catch (Exception $e) {
                DB::rollBack();
                return $this->error([], 'Server Error: ' . $e->getMessage(), 500);
            }
        }
        return $this->error([], 'Invalid payment method', 400);
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
                    return [
                        'product_id' => $item->product_id,
                        'name' => $item->product->product_name,
                        'thumbnail' => $item->product->product_image,
                        'weight_unit' => $item->product->weight_unit,
                        'weight' => $item->product->weight,
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
