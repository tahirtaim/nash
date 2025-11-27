<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\Slider;
use App\Models\Language;
use App\Models\SliderImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\SliderRequest;

class SliderController extends Controller
{
    public function index()
    {
        // $sliders = Slider::with('images')->get();
        $sliders = Slider::with('images', 'language')->get();
        $languages = Language::all(); // fetch all languages
        return view('backend.layouts.slider.index', compact('sliders', 'languages'));
    }

    public function store(SliderRequest $request)
    {
        try {
            DB::beginTransaction();
            $data = $request->validated();
            $data['language_id'] = $request->language_id;


            // Check if a slider already exists for this page
            // if (!empty($data['page_name'])) {
            //     $existingSlider = Slider::where('page_name', $data['page_name'])->first();
            //     if ($existingSlider) {
            //         return back()->with('error', 'Slider already exists for this page');
            //     }
            // }
            $slider = Slider::create($data);

            if ($request->hasFile('images')) {

                foreach ($request->file('images') as $image) {
                    $imagePath = $this->uploadImage($image, null, 'uploads/slider', 300, null);
                    if ($imagePath) {
                        SliderImage::create([
                            'slider_id' => $slider->id,
                            'image_path' => $imagePath
                        ]);
                    }
                }
            }

            DB::commit();
            return back()->with('success', 'Slider created successfully');
        } catch (Exception $e) {
            DB::rollBack();
            return back()->with('error', 'Something went wrong: ' . $e->getMessage());
        }
    }

    public function edit($id)
    {

        // $sliders = Slider::with('images')->get();
        $sliders = Slider::with('images', 'language')->get(); // fetch language data
        $languages = Language::all(); // fetch all languages
        $updateSlider = Slider::find($id);

        // dd($updateSlider);
        if (!$updateSlider) {
            return redirect()->route('slider.index')->with('error', 'Slider not found');
        }
        return view('backend.layouts.slider.index', compact('sliders', 'updateSlider', 'languages'));
    }

    public function update(Request $request, $id)
    {
        $slider = Slider::find($id);
        $images = SliderImage::where('slider_id', $slider->id)->get();
        if (!$slider) {
            return back()->with('error', 'Slider not found');
        }

        $data = $request->all();

        $slider->update($data);

        // Handle image update
        if ($request->hasFile('images')) {
            foreach ($images as $image) {
                $this->deleteImage($image->image_path);
                $image->delete();
            }

            foreach ($request->file('images') as $image) {
                $imagePath = $this->uploadImage($image, null, 'uploads/slider', 300, null);
                if ($imagePath) {
                    SliderImage::create([
                        'slider_id' => $slider->id,
                        'image_path' => $imagePath
                    ]);
                }
            }
        }
        return redirect()->route('slider.index')->with('success', 'Slider updated successfully');
    }

    public function destroy($id)
    {
        $slider = Slider::find($id);
        if (!$slider) {
            return back()->with('error', 'Slider not found');
        }

        // Delete images if any
        if ($slider->images) {
            foreach ($slider->images as $img) {
                if (file_exists(public_path($img->image_path))) {
                    unlink(public_path($img->image_path));
                }
                $img->delete();
            }
        }

        $slider->delete();
        return back()->with('success', 'Slider deleted successfully');
    }
}
