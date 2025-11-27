<?php

namespace App\Http\Controllers\Blog;

use App\Models\Blog;
use App\Models\Language;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class BlogController extends Controller
{
    public function __construct()
    {
        // Protect only specific actions
        $this->middleware('permission:blog create')->only(['create', 'store  ']);
        $this->middleware('permission:blog view')->only(['index', 'show', 'changeStatus']);
        $this->middleware('permission:blog edit')->only(['edit', 'update']);
        $this->middleware('permission:blog delete')->only(['destroy']);
    }

    public function index(Request $request)
    {

        if ($request->ajax()) {
            // $data = Blog::latest();
            $data = Blog::with('language')->latest();

            return DataTables::of($data)
                ->addColumn('checkbox', function ($row) {
                    return '<div class="form-check text-center">
                        <input type="checkbox" class="form-check-input rowCheckbox" value="' . $row->id . '">
                    </div>';
                })

                ->filter(function ($query) use ($request) {
                    if ($search = $request->input('search.value')) {
                        $query->where(function ($q) use ($search) {
                            $q->where('title', 'like', "%{$search}%")
                                ->orWhere('slug', 'like', "%{$search}%")
                                ->orWhere('description', 'like', "%{$search}%")
                            ;
                        });
                    }
                })

                ->addIndexColumn()

                ->addColumn('title', function ($row) {
                    return '<div class="d-flex align-items-center">
                        <strong>' . e(Str::limit(strip_tags($row->description), 10)) . '</strong>
                    </div>';
                })
                ->addColumn('description', function ($row) {
                    return '<div>' . Str::limit(strip_tags($row->description), 20) . '</div>';
                })

                ->addColumn('image', function ($row) {
                    if ($row->image) {
                        return '<img src="' . asset($row->image) . '" width="60">';
                    }
                    return '<span class="text-muted">No Image</span>';
                })

                ->addColumn('status', function ($row) {
                    return $row->status == '1'
                        ? '<span class="badge bg-success">Published</span>'
                        : '<span class="badge bg-secondary">Draft</span>';
                })
                ->addColumn('language', function ($row) {
                    // Check if language exists and display the language name
                    return $row->language ? $row->language->name : 'No Language';
                })
                ->addColumn('action', function ($row) {
                    $statusRoute = route('blog.status.change', [$row->id, $row->status == 1 ? 0 : 1]);
                    $checked = $row->status == 1 ? 'checked' : '';

                    return '
                        <div class="d-flex align-items-center gap-2">


                            <!-- Status Switcher with <a> -->
                            <a href="' . $statusRoute . '"
                            class="btn btn-ghost btn-icon btn-sm rounded-circle texttooltip status-link"
                            data-template="statusToggle"
                            title="Toggle Status">
                                <div class="form-check form-switch m-0">
                                    <input class="form-check-input" type="checkbox" role="switch" ' . $checked . ' disabled>
                                </div>
                                <div id="statusToggle" class="d-none">
                                    <span>Status</span>
                                </div>
                            </a>

                            <a href="' . route('blog.show', $row->id) . '"
                                    class="btn btn-ghost btn-icon btn-sm rounded-circle texttooltip"
                                    data-template="eyeTwo">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                        height="24" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="feather feather-eye icon-xs">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                    <div id="eyeTwo" class="d-none"><span>View</span></div>
                            </a>

                            <!-- Edit -->
                            <a href="' . route('blog.edit', $row->id) . '" class="btn btn-ghost btn-icon btn-sm rounded-circle texttooltip" data-template="edit">
                                <i class="fas fa-edit"></i>
                                <div id="edit" class="d-none"><span>Edit</span></div>
                            </a>

                            <!-- Delete -->
                            <button type="button"
                                    data-url="' . route('blog.delete', $row->id) . '"
                                    class="btn-delete btn btn-ghost btn-icon btn-sm rounded-circle texttooltip"
                                    data-template="trashTwo">
                                <i class="fas fa-trash-alt"></i>
                                <div id="trashTwo" class="d-none"><span>Delete</span></div>
                            </button>


                        </div>
                    ';
                })


                ->rawColumns(['checkbox', 'title', 'description', 'image', 'status', 'action', 'language'])
                ->make(true);
        }

        $languages = Language::all(); // added new
        return view('backend.layouts.blog.index', compact('languages')); // modified
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $validator =  Validator::make($request->all(), [
            'title' => 'required |unique:blogs',
            'description' => 'required',
            'language_id'  => 'required|exists:languages,id',
            'image' => 'required|mimes:jpeg,jpg,png,gif,svg|max:10240',

        ]);
        if ($validator->fails()) {
            return redirect()
                ->back()
                ->withErrors($validator);
        }

        if ($request->title) {
            $blog = Blog::where('title', $request->title)->first();
            if ($blog) {
                return redirect()->back()->with('error', 'Blog title already exist');
            }
        }

        if (!$request->hasFile('image')) {
            return redirect()->back()->with('error', 'Image is required');
        }

        $image = $request->file('image');
        $blog_image_path = $this->uploadImage($image, null, 'uploads/blog', 300, 300);

        $blog = Blog::create([
            'title' => $request->title,
            'blog_type' => $request->blog_type,
            'slug' => Str::slug($request->title),
            'description' => $request->description,
            'image' => $blog_image_path,
            'language_id'  => $request->language_id  // NEW
        ]);


        return redirect()
            ->route('blog.index')
            ->with('success', 'Blog Created successfully');
    }
    // uploads/blog/202507162049.jpg-1752698942.jpg
    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // $blog = Blog::with('user')->find($id);
        $blog = Blog::with(['language', 'user'])->find($id);
        return view('backend.layouts.blog.show', compact('blog'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        if (!Blog::find($id)) {
            return redirect()
                ->route('blog.index')
                ->with('error', 'Blog not found');
        }
        $blog = Blog::find($id);
        $languages = Language::all(); // NEW
        return view('backend.layouts.blog.index', compact('blog', 'languages')); // modified
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $validator = Validator::make($request->all(), [
                'title' => 'required',
                'description' => 'required',
                'language_id'  => 'required|exists:languages,id', // NEW
                'image' => 'nullable|mimes:jpeg,jpg,png,gif,svg|max:2048',
            ]);

            if ($validator->fails()) {
                return redirect()
                    ->back()
                    ->withErrors($validator);
            }

            $blog = Blog::find($id);

            if (!$blog) {
                return redirect()
                    ->route('blog.index')
                    ->with('error', 'Blog not found');
            }

            if ($request->hasFile('image')) {
                $imageFile = $request->file('image');

                $blog_image_path = $this->uploadImage(
                    $imageFile,     // uploaded file
                    $blog->image,   // old image
                    'uploads/banner',
                    300,
                    300
                );

                // save new image
                $blog->image = $blog_image_path;
            }

            $blog->update([
                'title'       => $request->title,
                'blog_type'   => $request->blog_type,
                'image'       => $blog->image,
                'slug'        => Str::slug($request->title),
                'description' => $request->description,
                'language_id'  => $request->language_id,  // NEW
            ]);

            return redirect()
                ->route('blog.index')
                ->with('success', 'Blog updated successfully');
        } catch (\Exception $e) {
            return redirect()
                ->back()
                ->with('error', $e->getMessage());
        }
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $blog = Blog::find($id);
        $this->deleteImage($blog->image);
        $blog->delete();
        return redirect()
            ->route('blog.index')
            ->with('success', 'Blog deleted successfully');
    }


    public function changeStatus($id, $status)
    {
        $blog = Blog::find($id);
        $blog->status = $status;
        $blog->save();
        return redirect()->back()->with('success', 'Blog status updated successfully');
    }
}
