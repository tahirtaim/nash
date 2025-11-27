<?php

namespace App\Http\Controllers\Promocode;

use Svg\Tag\Rect;
use App\Models\Order;
use App\Models\PromoCode;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class PromocodeController extends Controller
{
    public function __construct()
    {
        // Protect only specific actions
        $this->middleware('permission:promocode create')->only(['create', 'store  ']);
        $this->middleware('permission:promocode view')->only(['index', 'show', 'toggleStatus']);
        $this->middleware('permission:promocode edit')->only(['edit', 'update']);
        $this->middleware('permission:promocode delete')->only(['destroy']);
    }
    public function index()
    {
        $promos = PromoCode::latest()->get();
        return view('backend.layouts.promocode.index', compact('promos',));
    }

    public function show(Request $request)
    {
        $id = $request->id;
        // return $id;
        $code = $request->code;

        // Sum total_amount for all orders with the given promo_code
        $total = Order::where('promo_code', $id)->sum('total_amount');
        $user = Order::where('promo_code', $id)->sum('user_id');

        // Return formatted response
        return response()->json([
            'total' => $total,
            'user' => $user,
            'promocode' => $code
        ]);
    }

    public function store(Request $request)
    {



        try {
            $validator = Validator::make($request->all(), [
                'code' => 'required|unique:promo_codes,code',
                'type' => 'required|in:fixed,percent',
                'value' => 'required|numeric|min:1',
                'min_order_amount' => 'nullable|numeric',
                'max_uses' => 'nullable|integer|min:1',
                'max_users' => 'nullable|integer|min:1',
                'expires_at' => 'nullable|date',
                'status' => 'required|boolean',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
            PromoCode::create($request->all());
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while creating the promo code: ' . $e->getMessage())->withInput();
        }

        return redirect()->route('promocode.index')->with('success', 'Promo Code created successfully.');
    }

    public function edit($id)
    {
        $promos = PromoCode::latest()->get();
        $promocode = PromoCode::findOrFail($id);

        return view('backend.layouts.promocode.index', compact('promocode', 'promos'));
    }

    public function update(Request $request, $id)
    {
        $promo = PromoCode::findOrFail($id);

        $request->validate([
            'code' => 'required|unique:promo_codes,code,' . $promo->id,
            'type' => 'required|in:fixed,percent',
            'value' => 'required|numeric|min:1',
            'min_order_amount' => 'nullable|numeric',
            'max_uses' => 'nullable|integer|min:0',
            'max_users' => 'nullable|integer|min:0',
            'expires_at' => 'nullable|date',
            'status' => 'required|boolean',
        ]);

        $promo->update($request->all());

        return redirect()->route('promocode.index')->with('success', 'Promo Code updated successfully.');
    }

    public function destroy($id)
    {
        $promo = PromoCode::findOrFail($id);
        $promo->delete();

        return redirect()->route('promocode.index')->with('success', 'Promo Code deleted successfully.');
    }


    public function toggleStatus(Request $request)
    {
        $promo = PromoCode::findOrFail($request->id);
        $promo->status = !$promo->status;
        $promo->save();

        return redirect()->route('promocode.index')->with('success', 'Promo Code status updated successfully.');
    }
}
