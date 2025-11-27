<?php

namespace App\Http\Controllers\Banner;

use App\Models\Banner;
use App\Models\Language;
use App\Models\BannerImage;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use \Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class BannerController extends Controller
{

    public function index(Request $request)
    {
        if (!Auth::user()->can('banner view')) {
            abort(403, 'Unauthorized action.');
        }

        if ($request->ajax()) {
            // $data = Banner::latest();
            $data = Banner::with('language')->latest(); //added new
            return DataTables::of($data)

                ->filter(function ($query) use ($request) {
                    if ($search = $request->input('search.value')) {
                        $query->where(function ($q) use ($search) {
                            $q->where('banner_title', 'like', "%{$search}%")
                                ->orWhere('banner_subtitle', 'like', "%{$search}%")
                            ;
                        });
                    }
                })

                ->addIndexColumn()
                ->addColumn('banner_title', function ($row) {
                    return '<div class="d-flex align-items-center">
                            <strong>' . e(Str::limit($row->banner_title, 10)) . '</strong>
                        </div>';
                })



                ->addColumn('banner_subtitle', function ($row) {
                    return '<div>' . e(Str::limit($row->banner_title, 10)) . '</div>';
                })


                ->addColumn('banner_image', function ($row) {
                    if ($row->images && $row->images->count() > 0) {
                        $imagesHtml = '';
                        foreach ($row->images as $image) {
                            $imagesHtml .= '<img src="' . asset($image->image_path) . '" width="60" class="me-1 mb-1">';
                        }
                        return $imagesHtml;
                    } else {
                        return '<img src="' . asset('uploads/logo.png') . '" width="60"> <br>';
                    }
                })
                ->rawColumns(['banner_image'])


                ->addColumn('status', function ($row) {
                    return $row->status == '1'
                        ? '<span class="badge bg-success">Active</span>'
                        : '<span class="badge bg-danger">Inactive</span>';
                })
                 ->addColumn('language', function ($row) { // added new
                    return $row->language ? $row->language->name : 'No Language';
                })
                ->addColumn('action', function ($row) {
                    $statusRoute = route('banner.status.change', [$row->id, $row->status == 1 ? 0 : 1]);
                    $checked = $row->status == 1 ? 'checked' : '';

                    $action = '<td><div class="d-flex align-items-center gap-2">';

                    //  Status toggle button
                    if (Auth::user()->can('banner status')) {
                        $action .= '
                    <a href="' . $statusRoute . '"
                        class="btn btn-icon btn-sm rounded-circle texttooltip status-link"
                        data-template="statusToggle" title="Toggle Status">
                        <div class="form-check form-switch m-0">
                            <input class="form-check-input" type="checkbox" role="switch" ' . $checked . ' disabled>
                        </div>
                        <div id="statusToggle" class="d-none">
                            <span>Status</span>
                        </div>
                    </a>';
                    }

                    //  Edit button
                    if (Auth::user()->can('banner edit')) {
                        $action .= '
                    <a href="' . route('banner.edit', $row->id) . '"
                        class="btn btn-icon btn-sm rounded-circle texttooltip"
                        data-template="edit">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="feather feather-edit icon-xs">
                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                        </svg>
                        <div id="edit" class="d-none"><span>Edit</span></div>
                    </a>';
                    }

                    // Delete button
                    if (Auth::user()->can('banner delete')) {
                        $action .= '
                    <button type="button" data-url="' . route('banner.delete', $row->id) . '"
                        class="btn-delete btn btn-icon btn-sm rounded-circle texttooltip"
                        data-template="trashTwo">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="feather feather-trash-2 icon-xs">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4
                                    a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            <line x1="10" y1="11" x2="10" y2="17"></line>
                            <line x1="14" y1="11" x2="14" y2="17"></line>
                        </svg>
                        <div id="trashTwo" class="d-none"><span>Delete</span></div>
                    </button>';
                    }

                    $action .= '</div></td>';

                    return $action;
                })

                ->rawColumns(['banner_title',  'banner_image', 'status', 'action', 'language'])
                ->make(true);
        }

        $languages = Language::all(); // added new

        return view('backend.layouts.banner.index', compact('languages')); // modified
    }


    /**
     * Show the form for creating a new resource.
     */

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (!Auth::user()->can('banner create')) {
            abort(403, 'Unauthorized action.');
        }

        // Validate request
        $validator = Validator::make($request->all(), [
            'banner_title' => 'required',
            'url' => 'required',
            'language_id' => 'required|exists:languages,id', // added new
            'banner_images.*' => 'required|image|mimes:jpeg,png,jpg,webp,gif|max:10240', // each image
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        // Create banner first
        $banner = Banner::create([
            'banner_title' => $request->banner_title,
            'banner_subtitle' => $request->banner_subtitle,
            'url' => $request->url,
            'language_id' => $request->language_id,
        ]);

        // Upload multiple images and save in banner_images table
        if ($request->hasFile('banner_images')) {
            foreach ($request->file('banner_images') as $image) {
                $path = $this->uploadImage($image, null, 'uploads/banner', 450, 300);

                BannerImage::create([
                    'banner_id' => $banner->id,
                    'image_path' => $path,
                ]);
            }
        }

        return redirect()->back()->with('success', 'Banner created successfully');
    }



    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        if (!Auth::user()->can('banner view')) {
            abort(403, 'Unauthorized action.');
        }
        // $banner = Banner::find($id);
        $banner = Banner::with(['language', 'images'])->find($id); // added new
        if (!$banner) {
            return redirect()->route('banner.index')->with('error', 'Banner not found');
        }
        return view('backend.layouts.banner.show', compact('banner'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        if (!Auth::user()->can('banner edit')) {
            abort(403, 'Unauthorized action.');
        }
        if (!Banner::find($id)) {
            return redirect()
                ->route('banner.index')
                ->with('error', 'Banner not found');
        }
        $banner = Banner::with('images')->find($id);

        $languages = Language::all(); // added new

        return view('backend.layouts.banner.index', compact('banner', 'languages')); // modified
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        if (!Auth::user()->can('banner edit')) {
            abort(403, 'Unauthorized action.');
        }

        // Validate request
        $validator = Validator::make($request->all(), [
            'banner_title' => 'required',
            'url' => 'required',
            'language_id' => 'required|exists:languages,id', // added new
            'banner_images.*' => 'required|image|mimes:jpeg,png,jpg,webp,gif|max:10240', // each image
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        try {
            $banner = Banner::find($id);
            if (!$banner) {
                return redirect()->route('banner.index')->with('error', 'Banner not found');
            }

            DB::transaction(function () use ($request, $banner) {

                // Update banner fields
                $banner->update([
                    'banner_title' => $request->banner_title,
                    'banner_subtitle' => $request->banner_subtitle,
                    'url' => $request->url,
                    'language_id' => $request->language_id,  // added new
                ]);

                // Handle multiple images
                if ($request->hasFile('banner_images')) {

                    // Delete old images from storage and database
                    foreach ($banner->images as $oldImage) {
                        if (File::exists(public_path($oldImage->image_path))) {
                            File::delete(public_path($oldImage->image_path));
                        }
                        $oldImage->delete();
                    }

                    // Upload new images
                    foreach ($request->file('banner_images') as $imageFile) {
                        $imagePath = $this->uploadImage($imageFile, null, 'uploads/banner', 450, 300);

                        BannerImage::create([
                            'banner_id' => $banner->id,
                            'image_path' => $imagePath,
                        ]);
                    }
                }
            });

            return redirect()->route('banner.index')->with('success', 'Banner updated successfully');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        if (!Auth::user()->can('banner delete')) {
            abort(403, 'Unauthorized action.');
        }
        if (!Banner::find($id)) {
            return redirect()
                ->route('banner.index')
                ->with('error', 'Banner not found');
        }


        try {
            $banner = Banner::find($id);
            $banner->delete();
            $this->deleteImage($banner->banner_image);
            return redirect()
                ->route('banner.index')
                ->with('success', 'Banner deleted successfully');
        } catch (\Exception $e) {
            return redirect()
                ->back()
                ->with('error', $e->getMessage());
        }
    }


    public function changeStatus($id, $status)
    {
        if (!Auth::user()->can('banner status')) {
            abort(403, 'Unauthorized action.');
        }
        $banner = Banner::find($id);
        $banner->status = $status;
        $banner->save();
        return redirect()
            ->route('banner.index')
            ->with('success', 'Banner status changed successfully');
    }
}
