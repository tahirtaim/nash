<?php

namespace App\Http\Controllers\Api;

use App\Models\PromoCode;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use App\Models\PromoCodeUsers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class PromocodeController extends Controller
{

    use ApiResponse;


    public function GetPromo()
    {
        $promo = PromoCode::where('status', 1)
            ->select('id', 'code', 'type', 'value', 'min_order_amount', 'max_uses', 'uses', 'max_users', 'used_by_users', 'expires_at')
            ->first();

        if (!$promo) {
            return $this->error('No active promo code found', 404);
        }

        return $this->success($promo, 'Promo Code retrieved successfully', 200);
    }





    public function apply(Request $request)
    {
        $user = Auth::user();
        if (!$user) {
            return $this->error('', 'Unauthenticated User', 401);
        }

        $validator = Validator::make($request->all(), [
            'code' => 'required|string|exists:promo_codes,code',
            'order_amount' => 'required|numeric|min:1',
        ]);

        if ($validator->fails()) {
            return $this->error('Validation Error', $validator->errors(), 422);
        }

        $promo = PromoCode::where('code', $request->code)
            ->where('status', 1)->first();

        if (!$promo) {
            return $this->error('', 'Promo code is unavailable', 404);
        }

        // Minimum order amount check
        if ($promo->min_order_amount && $request->order_amount < $promo->min_order_amount) {
            return $this->error('', 'Order amount does not meet the minimum requirement for this promo code', 400);
        }


        // Expiry check
        if ($promo->expires_at && $promo->expires_at->isPast()) {
            return $this->error('', 'Promo code has expired', 400);
        }


        // Per-user limit check
        if ($promo->max_users && $promo->used_by_users >= $promo->max_users) {
            return $this->error('', 'Promo code maximum user limit reached', 400);
        }
        $usage = $promo->max_uses && $promo->uses >= $promo->max_uses;
        if ($usage) {
            return $this->error('', 'You have already reached your max number usage', 400);
        }

        // Store usage
        promoCodeUsers::create([
            'user_id' => $user->id,
            'promo_code_id' => $promo->id,
            'used_at' => now(),
        ]);

        // Update counts
        $promo->increment('uses');

        // Increment unique users only if first time
        $alreadyUsed = promoCodeUsers::where('user_id', $user->id)
            ->where('promo_code_id', $promo->id)
            ->exists();

        if (!$alreadyUsed) {
            $promo->increment('used_by_users');
        }

        return $this->success((object)[], 'Promo code applied successfully', 200);
    }
}
