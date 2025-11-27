<?php

namespace App\Http\Controllers\Backend;

use App\Models\AboutUs;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class AboutUsPageController extends Controller
{
    public function edit()
    {
        $languages = Language::all();
        $defaultLang = $languages->first();
        $aboutus = AboutUs::where('language_id', $defaultLang->id)->first();

        return view('backend.layouts.aboutus.edit', compact('aboutus', 'languages', 'defaultLang'));
    }

    public function getAboutUs($languageId)
    {
        $aboutus = AboutUs::where('language_id', $languageId)->first();

        return response()->json([
            'success' => true,
            'data'    => $aboutus
        ]);
    }

    public function updateAboutUs(Request $request, $languageId)
    {
        $language = Language::findOrFail($languageId);

        $aboutus = AboutUs::firstOrNew(['language_id' => $language->id]);

        $validator = Validator::make($request->all(), [
            'welcome_title'        => 'required|string|max:255',
            'welcome_description'  => 'required|string',
            'story_title'          => 'required|string|max:255',
            'story_description'    => 'required|string',
            'philosophy_title'     => 'required|string|max:255',
            'philosophy_description' => 'required|string',
            'product_title'        => 'required|string|max:255',
            'product_description'  => 'required|string',
            'community_title'      => 'required|string|max:255',
            'community_description' => 'required|string',
            'touch_title'          => 'required|string|max:255',
            'touch_description'    => 'required|string',
            'status'               => 'required|integer|in:0,1',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors'  => $validator->errors()
            ], 422);
        }

        // Assign all values
        $aboutus->welcome_title        = $request->welcome_title;
        $aboutus->welcome_description  = $request->welcome_description;
        $aboutus->story_title          = $request->story_title;
        $aboutus->story_description    = $request->story_description;
        $aboutus->philosophy_title     = $request->philosophy_title;
        $aboutus->philosophy_description = $request->philosophy_description;
        $aboutus->product_title        = $request->product_title;
        $aboutus->product_description  = $request->product_description;
        $aboutus->community_title      = $request->community_title;
        $aboutus->community_description = $request->community_description;
        $aboutus->touch_title          = $request->touch_title;
        $aboutus->touch_description    = $request->touch_description;
        $aboutus->status               = $request->status;

        $aboutus->save();

        return response()->json([
            'success' => true,
            'message' => 'About Us updated successfully!'
        ]);
    }
}
