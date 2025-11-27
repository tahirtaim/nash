<?php

namespace App\Http\Controllers\Settings;

use App\Models\AdminSetting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\InvoiceSetting;

class AdminSettingsController extends Controller
{

    public function __construct()
    {
        // Protect only specific actions
        $this->middleware('permission:admin setting update')->only(['index', 'adminSettingUpdate', 'SetInvoiceNumber', 'SetDeliveryCharge']);
    }

    function index()
    {
        $admin = AdminSetting::first(); // Fetch the first admin setting record
        $InvoiceSetting = InvoiceSetting::first();

        return view('backend.layouts.settings.admin_setting.index', [
            'admin' => $admin,
            'InvoiceSetting' => $InvoiceSetting
        ]);
    }

    public function adminSettingUpdate(Request $request)
    {
        $request->validate([
            'title' => 'required|string',
            'email' => 'nullable|email',
            'logo' => 'nullable|image',
            'favicon' => 'nullable|image',
            'copyright' => 'nullable|string',
            'hotline' => 'nullable|string',
            'address' => 'nullable|string', // 
        ]);

        $admin_setting = AdminSetting::first();
        if (!$admin_setting) {
            $admin_setting = new AdminSetting();
        }

        $data = [
            'title' => $request->title,
            'email' => $request->email,
            'copyright' => $request->copyright,
            'hotline' => $request->hotline,
            'address' => $request->address, // 
        ];

        // logo handle
        $logoPath = $this->uploadImage($request->logo, $admin_setting->logo, 'uploads/adminlogo');
        $data['logo'] = $logoPath;

        // favicon handle
        $faviconPath = $this->uploadImage($request->favicon, $admin_setting->favicon, 'uploads/adminfavicon');
        $data['favicon'] = $faviconPath;

        if ($admin_setting->exists) {
            $admin_setting->update($data);
        } else {
            AdminSetting::create($data);
        }

        return redirect()->route('admin.setting.index')->with('success', 'Admin Setting updated successfully');
    }

    public function SetInvoiceNumber(Request $request)
    {
        $request->validate([
            'invoice_number' => 'required|integer|min:1',
        ]);

        $admin_setting = AdminSetting::first();
        if (!$admin_setting) {
            $admin_setting = new AdminSetting();
        }

        // Admin নতুন invoice number set করলো
        $admin_setting->invoice_number = $request->invoice_number;

        // Reset করে দিলাম যাতে নতুন order এই number থেকে শুরু হয়
        $admin_setting->last_order_number = null;

        $admin_setting->save();

        return redirect()->route('admin.setting.index')
            ->with('success', 'Invoice number set successfully');
    }


    public function SetDeliveryCharge(Request $request)
    {

        $request->validate([
            'delivery_charge' => 'required|min:1',
        ]);

        $admin_setting = AdminSetting::first();
        if (!$admin_setting) {
            $admin_setting = new AdminSetting();
        }

        $admin_setting->delivery_charge = $request->delivery_charge;
        $admin_setting->save();

        return redirect()->route('admin.setting.index')->with('success', 'Delivery Charge set successfully');
    }
    public function SetInvoiceSetting(Request $request)
    {
        // Fetch existing record 
        $setting = InvoiceSetting::first();

        // Handle logo upload 
        $logoPath = $this->uploadImage(
            $request->file('invoice_logo'),
            $setting->invoice_logo ?? null,
            'uploads/invoiceLogo'
        );

        $data = [
            'title' => $request->title ?? 'The Title',
            'invoice_logo' => $logoPath ?? 'uploads/allurdevine.png',
        ];

        if ($setting) {
            $setting->update($data);
        } else {
            InvoiceSetting::create($data);
        }

        return redirect()->route('admin.setting.index')
            ->with('success', 'Invoice Setting set successfully');
    }
}
