<?php

namespace App\Http\Controllers\Api;

use App\Models\Offer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\OfferProduct;
use App\Traits\ApiResponse;

class OfferController extends Controller
{
    use ApiResponse;
    public function allOffer(Request $request)
    {
        $languageId = $request->language_id;

        $offers = Offer::where('status', 1)
        ->where('language_id', $languageId)
            ->select('id', 'offer_name', 'image' , 'discount_value', 'total_price', 'offer_start_date', 'offer_end_date' , 'description')
            ->get();

        // Attach products for each offer
        $offers->each(function ($offer) {
            // Convert image to full URL
            $offer->image = asset($offer->image);

            // Get all associated products for this offer
            $offer->products = OfferProduct::where('offer_id', $offer->id)
                ->with('product') // Optional: eager load related Product
                ->get();
        });

        if ($offers->count() > 0) {
            return $this->success($offers, 'All available offers retrieved successfully', 200);
        }

        return $this->success([], 'Offer not available', 200);
    }


    public function offerDetails(Request $request, $id)
    {
        $languageId = $request->language_id;

        $offerDetails = Offer::with('products')->where('language_id', $languageId)->find($id);
    
        if (!$offerDetails) {
            return $this->error('Offer not found', 404);
        }

     
  
        $data = [
            'id' => $offerDetails->id,
            'title' => $offerDetails->offer_name ?? null,
            'discount' => $offerDetails->discount_value ?? null,
            'total_price' => $offerDetails->total_price ?? null,
            'image' => asset($offerDetails->image),
            'discount_price' => $offerDetails->discount_price ?? null,
            'description' => $offerDetails->description,
            'products' => $offerDetails->products->map(function ($product) {
                return [
                    'name' => $product->product_name,
                    'image' => asset($product->product_image),
                ];
            }),
        ];
    
        return $this->success($data, 'Offer details fetched successfully', 200);
    }
    
}
