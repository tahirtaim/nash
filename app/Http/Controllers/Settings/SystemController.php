<?php

namespace App\Http\Controllers\Settings;

use App\Models\Social;
use App\Models\System;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\FeatureSection;

class SystemController extends Controller
{
    public function __construct()
    {
        // Protect only specific actions
        $this->middleware('permission:system setting update')->only(['index', 'adminSettingUpdate', 'SetInvoiceNumber', 'SetDeliveryCharge']);
    }
    function index()
    {
        $system = System::first();
        $instagram = Social::where('id', '1')->first();
        $facebook = Social::where('id', '2')->first();
        $twitter = Social::where('id', '3')->first();
        $tiktok = Social::where('id', '4')->first();
        // Fetch feature sections and organize them by key
        $freeshipping = FeatureSection::where('key', 'free_shipping')->first();
        $support = FeatureSection::where('key', 'support_24_7')->first();;



        return view('backend.layouts.settings.system.index', [
            'system' => $system,
            'instagram' => $instagram,
            'facebook' => $facebook,
            'twitter' => $twitter,
            'tiktok' => $tiktok,
            'freeshipping' => $freeshipping,
            'support' => $support,
        ]);
    }



    public function systemupdate(Request $request)
    {
        $request->validate([
            'title' => 'required|string',
            'email' => 'nullable|email',
            'logo' => 'nullable|image|mimes:jpeg,jpg,png,svg',
            'favicon' => 'nullable|image|mimes:jpeg,jpg,png,',
            'copyright' => 'nullable|string',
        ]);

        $system = System::first();
        if (!$system) {
            $system = new System();
        }

        $data = [
            'title' => $request->title,
            'email' => $request->email,
            'copyright' => $request->copyright,
        ];

        // logo handle
        $logoPath =  $this->uploadImage($request->logo, $system->logo, 150, 150, 'uploads/logo');
        $data['logo'] = $logoPath ?? 'uploads/default.png';

        //favicon handle
        $faviconPath =  $this->uploadImage($request->favicon, $system->favicon, 150, 150, 'uploads/favicon');
        $data['favicon'] = $faviconPath ?? 'uploads/default.png';

        if ($system->exists) {
            $system->update($data);
        } else {
            System::create($data);
        }

        return redirect()->route('system.index')->with('success', 'System settings updated successfully');
    }


    public function updateSocials(Request $request)
    {
        $section = $request->submit_section;

        $socialData = [
            'instagram' => [
                'id' => 1,
                'name' => $request->instagram_title,

                'url' => $request->instagram_url,
            ],
            'facebook' => [
                'id' => 2,
                'name' => $request->facebook_title,

                'url' => $request->facebook_url,
            ],
            'twitter' => [
                'id' => 3,
                'name' => $request->twitter_title,

                'url' => $request->twitter_url,
            ],
            'tiktok' => [
                'id' => 4,
                'name' => $request->tiktok_title,

                'url' => $request->tiktok_url,
            ],
        ];

        if (array_key_exists($section, $socialData)) {
            $data = $socialData[$section];

            DB::table('socials')
                ->where('id', $data['id'])
                ->update([
                    'name' => $data['name'],

                    'url' => $data['url'],
                    'updated_at' => now(),
                ]);
        }

        return redirect()->back()->with('success', ucfirst($section) . ' updated successfully!');
    }


    public function updateFeatureSection(Request $request)
    {
        if ($request->submit_section == 'free_shipping') {
            $free_shipping = FeatureSection::where('key', 'free_shipping')->first();

            $free_shipping->update([
                'title' => $request->free_shipping_title,
                'description' => $request->free_shipping_description,
            ]);
        }


        if ($request->submit_section == 'support_24_7') {

            $support = FeatureSection::where('key', 'support_24_7')->first();

            $support->update([
                'title' => $request->support_24_7_title,
                'description' => $request->support_24_7_description,
            ]);
        }







        return redirect()->back()->with('success', 'Feature sections updated successfully!');
    }
}
