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
            'product_id' => 'required|integer|exists:products,id',
        ]);


        if ($validator->fails()) {
            return $this->error($validator->errors(), 'Validation Error', 422);
        }

        $type = null;
        if ($request->p_type) {
            $type = $request->p_type;
        }

        $id = Auth::guard('api')->user()->id;
        Cart::create([
            'user_id' =>  $id,
            'product_id' => $request->product_id,
            'p_type' =>  $type
        ]);

        return $this->success([], 'Product added to cart successfully', 200);
    }


    public function getCartItems(Request $request)
    {
        $id = Auth::guard('api')->user()->id;
        $cart_items = Cart::with('product')->where('user_id', $id)->get();

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

                $item->offer_name = $item->offer->offer_name ?? null;;
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
