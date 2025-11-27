<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use App\Traits\ApiResponse;

use Illuminate\Support\Str;
use Illuminate\Http\Request;

class SliderController extends Controller
{
    use ApiResponse;

    public function getPageSlider(Request $request)
    {
        if (!$request->has('page_name')) {
            return $this->error([], 'Page name is required', 422);
        }
        $page_name = Str::lower($request->page_name);

        $slider = Slider::with('images')
            ->where('page_name', $page_name)
            ->first();

        if (!$slider) {
            return $this->error([], 'Slider not found', 404);
        }

        $sliderData = [
            "id" => $slider->id,
            "title" => $slider->title,
            "description" => $slider->description,
            "button_text" => $slider->button_text,
            "button_link" => $slider->button_link,
            "page_name" => $slider->page_name,
            "images"  => $slider->images->map(function ($img) {
                return asset($img->image_path); // full URL
            }),
        ];

        return $this->success($sliderData, 'Slider fetched successfully', 200);
    }
}
