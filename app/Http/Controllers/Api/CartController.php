<?php

namespace App\Http\Controllers\Api;

use App\Models\Cart;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Traits\ApiResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{
    use ApiResponse;
    public function addToCart(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'product_id' => 'required|integer',
            'p_type' => 'nullable|string|in:product,offer',
        ]);

        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Validation Error', 422);
        }

        $type = $request->p_type ?? 'product';
        
        if ($type == 'offer') {
             if (!\App\Models\Offer::find($request->product_id)) {
                 return $this->error([], 'Offer not found', 404);
             }
        } else {
             if (!\App\Models\Product::find($request->product_id)) {
                 return $this->error([], 'Product not found', 404);
             }
        }

        $id = Auth::guard('api')->user()->id;
        Cart::create([
            'user_id' =>  $id,
            'product_id' => $type == 'product' ? $request->product_id : null,
            'offer_id' => $type == 'offer' ? $request->product_id : null,
            'p_type' =>  $type
        ]);

        return $this->success([], 'Product added to cart successfully', 200);
    }


    public function getCartItems(Request $request)
    {
        $id = Auth::guard('api')->user()->id;
        $cart_items = Cart::with(['product', 'offer'])->where('user_id', $id)->get();

        if ($cart_items->count() > 0) {
            collect($cart_items)->each(function ($item) {
                if ($item->product) {
                    $item->product->product_image = asset($item->product->product_image);

                    // Hide unnecessary fields
                    $item->product->makeHidden([
                        'short_description',
                        'description',
                        'additional_description'
                    ]);
                }

                if ($item->offer) {
                    $item->offer_name = $item->offer->offer_name;
                    $item->offer_price = $item->offer->final_price;
                    $item->offer_image = asset($item->offer->image);
                } else {
                    $item->offer_name = null;
                }
            });

            return $this->success($cart_items, 'Cart items retrieved successfully', 200);
        }

        return $this->success([], 'No items in cart', 200);
    }



    public function destroyCart(Request $request)
    {
        $userId = Auth::guard('api')->user()->id;

        $cart_item = Cart::where('user_id', $userId)->where('id', $request->id)->first();

        if (!$cart_item) {
            return $this->error([], 'Cart not found!', 404);
        }

        $cart_item->delete();
        return $this->success([], 'Cart deleted successfully', 200);
    }
}
