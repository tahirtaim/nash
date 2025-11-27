<?php

namespace App\Http\Controllers\Video;

use App\Models\Video;
use App\Models\Language;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class VideoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            // $data = Video::latest();
             $data = Video::with('language')->latest();

            return DataTables::of($data)
                ->addColumn('checkbox', function ($row) {
                    return '<div class="form-check text-center">
                <input type="checkbox" class="form-check-input rowCheckbox" value="' . $row->id . '">
            </div>';
                })
                ->addIndexColumn()

                ->addColumn('title', function ($row) {
                    return '<div class="d-flex align-items-center">
                        <i class="fas fa-video text-danger me-2"></i>
                        <strong>' .substr($row->title, 0, 50) . '</strong>
                        </div>';
                })
                ->filter(function ($query) use ($request) {
                    if ($search = $request->input('search.value')) {
                        $query->where(function ($q) use ($search) {
                            $q->where('title', 'like', "%{$search}%");
                        });
                    }
                })

                ->addColumn('thumbnail', function ($row) {
                    if ($row->thumbnail) {
                        return '<img src="' . asset($row->thumbnail) . '" class="img-thumbnail" width="100" height="100">';
                    } else {
                        return 'No thumbnail';
                    }
                })


                ->addColumn('youtube_link', function ($row) {

                    if ($row->youtube_link) {

                        return '<a href="' . e($row->youtube_link) . '" target="_blank">Watch Video</a>';
                    }
                    return '<span class="text-muted">No Link</span>';
                })

                ->addColumn('status', function ($row) {
                    return $row->video_type == 'popular'
                        ? '<span class="badge bg-success">Popular</span>'
                        : '<span class="badge bg-secondary">Featured</span>';
                })
                ->addColumn('language', function ($row) { // added new
                    return $row->language ? $row->language->name : 'No Language';
                })
                ->addColumn('action', function ($row) {
                    return '
            <td>
                <a href="' . route('video.show', $row->id) . '"
                    class="btn btn-ghost btn-icon btn-sm rounded-circle texttooltip"
                    data-template="eyeTwo">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
                        height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-eye icon-xs">
                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z">
                        </path>
                        <circle cx="12" cy="12" r="3"></circle>
                    </svg>
                    <div id="eyeTwo" class="d-none">
                        <span>View</span>
                    </div>
                </a>
                <a href="' . route('video.edit', $row->id) . '"
                    class="btn btn-ghost btn-icon btn-sm rounded-circle texttooltip"
                    data-template="edit">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
                        height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-edit icon-xs">
                        <path
                            d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7">
                        </path>
                        <path
                            d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z">
                        </path>
                    </svg>
                    <div id="edit" class="d-none">
                        <span>Edit</span>
                    </div>
                </a>
                <button type="button" data-url="' . route('video.delete', $row->id) . '"
                    class="btn-delete btn btn-ghost btn-icon btn-sm rounded-circle texttooltip"
                    data-template="trashTwo">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
                        height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2"
                        stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-trash-2 icon-xs">
                        <polyline points="3 6 5 6 21 6"></polyline>
                        <path
                            d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                        </path>
                        <line x1="10" y1="11" x2="10"
                            y2="17"></line>
                        <line x1="14" y1="11" x2="14"
                            y2="17"></line>
                    </svg>
                    <div id="trashTwo" class="d-none">
                        <span>Delete</span>
                    </div>
                </button>
            </td>
            <div class="dropdown d-inline">
                    <button class="btn btn-sm btn-icon btn-ghost rounded-circle Z-index" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-ellipsis-v"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        ' . ($row->video_type != 'popular' ? '
                        <li>
                            <a class="dropdown-item btn-status"
                            href="' . route('video.status.change', ['id' => $row->id, 'video_type' => 'popular']) . '">
                                <i class="fas fa-upload text-success me-2"></i> Popular
                            </a>
                        </li>' : '') . '

                        ' . ($row->video_type != 'featured' ? '
                        <li>
                            <a class="dropdown-item btn-status"
                            href="' . route('video.status.change', ['id' => $row->id, 'video_type' => 'featured']) . '">
                                <i class="fas fa-pencil-alt text-warning me-2"></i> Featured
                            </a>
                        </li>' : '') . '
                    </ul>
                </div>

             ';
                })

                ->rawColumns(['checkbox', 'title', 'thumbnail', 'youtube_link', 'status', 'action', 'language'])
                ->make(true);
        }
        
         $languages = Language::all(); // added new

        return view('backend.layouts.video.index', compact('languages')); // modified
    }

    /**
     * Show the form for creating a new resource.
     */


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'thumbnail' => 'nullable|image|mimes:jpg,jpeg,png,svg|max:10240',
            'language_id' => 'required|exists:languages,id',
            'video_type' => 'required',
            'youtube_link' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }


        $thumbnail_path = null;
        if ($request->hasFile('thumbnail')) {
            $thumbnail = $request->file('thumbnail');
            $thumbnail_path = $this->uploadImage($thumbnail, null, 'uploads/video', 300, 300);
        }

        Video::create([
            'title' => $request->title,
            'thumbnail' => $thumbnail_path,
            'video_type' => $request->video_type,
            'youtube_link' => $request->youtube_link,
            'language_id' => $request->language_id,
        ]);

        return redirect()->route('video.index')->with('success', 'Video created successfully');
    }


    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // $video = Video::find($id);
        $video = Video::with('language')->find($id);
        return view('backend.layouts.video.show', compact('video'));
    }

    /**
     * Show the form for editing the specified resource.
     */   public function edit($id)
    {
        if (!Video::find($id)) {
            return redirect()
                ->route('video.index')
                ->with('error', 'Video not found');
        }
        $video = Video::find($id);

        $languages = Language::all(); // added new

        return view('backend.layouts.video.index', compact('video', 'languages')); // modified
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => 'required',
                'thumbnail' => 'nullable|image|mimes:jpg,jpeg,png,svg|max:10240',
                'language_id' => 'required|exists:languages,id', // added new
                'video_type' => 'required',
                'youtube_link' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }

            $video = Video::findOrFail($id);

            $thumbnail_path = $video->thumbnail;

            if ($request->hasFile('thumbnail')) {
                $thumbnail = $request->file('thumbnail');
                $thumbnail_path = $this->uploadImage($thumbnail, $video->thumbnail, 'uploads/video', 300, 300);
            }

            $video->update([
                'title' => $request->title,
                'thumbnail' => $thumbnail_path,
                'video_type' => $request->video_type,
                'youtube_link' => $request->youtube_link,
                'language_id' => $request->language_id,  // added new
            ]);

            return redirect()->route('video.index')->with('success', 'Video updated successfully');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $video = Video::find($id);
        $video->delete();
        $this->deleteImage($video->thumbnail);
        return redirect()
            ->route('video.index')
            ->with('success', 'Video deleted successfully');
    }

    public function changeStatus($id, $video_type)
    {
        $video = Video::find($id);
        $video->video_type = $video_type;
        $video->save();
        return redirect()->back()->with('success', 'Video status updated successfully');
    }
}
