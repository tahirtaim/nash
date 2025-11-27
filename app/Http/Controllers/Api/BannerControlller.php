<?php

namespace App\Http\Controllers\Api;

use App\Models\Banner;
use App\Models\AboutUs;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

use function PHPSTORM_META\map;
use App\Http\Controllers\Controller;

class BannerControlller extends Controller
{
    use ApiResponse;
    public function getBanner(Request $request)
    {
        $languageId = $request->language_id; // Get language_id from the request

        $banner = Banner::with('images')
            ->where('status', 1)
            ->where('language_id', $languageId) //new line added for language filtering
            ->select('id', 'banner_title', 'banner_subtitle')
            ->first();

        if ($banner) {

            // Map only the image paths as URLs
            $bannerImages = $banner->images->map(function ($image) {
                return asset($image->image_path); // full URL
            });

            // Assign to a new attribute
            $banner->image_paths = $bannerImages;

            // Optional: remove the original relation to avoid confusion
            unset($banner->images);

            return $this->success($banner, 'Banner retrieved successfully', 200);
        }

        return $this->success((object)[], 'Banner not found', 200);
    }

    public function getAboutUsContent(Request $request)
    {
        $languageId = $request->language_id;

        $aboutuscontent = AboutUs::where('status', 1)
            ->where('language_id', $languageId)
            ->first();

        if (!$aboutuscontent) {
            return $this->error(null, 'About Us Content not found', 404);
        }

        // Hide unwanted fields
        $aboutuscontent->makeHidden(['created_at', 'updated_at']);

        return $this->success([
            'aboutuscontent'   => $aboutuscontent,
        ], 'About Us Content retrieved successfully');
    }
}
