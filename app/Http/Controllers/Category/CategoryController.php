<?php

namespace App\Http\Controllers\Category;

use App\Models\Category;
use App\Models\Language;
use App\Traits\ApiResponse;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;



class CategoryController extends Controller
{
    use ApiResponse;
    public function __construct()
    {
        // Protect only specific actions
        $this->middleware('permission:category create')->only(['create', 'store  ']);
        $this->middleware('permission:category view')->only(['index', 'show', 'changeStatus']);
        $this->middleware('permission:category edit')->only(['edit', 'update']);
        $this->middleware('permission:category delete')->only(['destroy']);
    }


    public function index(Request $request)
    {
        if ($request->ajax()) {
             $data = Category::with('language')->latest();

            return DataTables::of($data)
                ->addIndexColumn()



                ->filter(function ($query) use ($request) {
                    if ($search = $request->input('search.value')) {
                        $query->where(function ($q) use ($search) {
                            $q->where('name', 'like', "%{$search}%")
                                ->orWhere('slug', 'like', "%{$search}%");
                        });
                    }
                })


                // Category Title
                ->addColumn('category_title', function ($row) {
                    return '<div class="d-flex align-items-center">
                            <strong>' . e($row->name) . '</strong>
                        </div>';
                })

                // Slug column
                ->addColumn('slug', function ($row) {
                    return '<div class="d-flex align-items-center">
                         
                            <strong>' . e($row->slug) . '</strong>
                        </div>';
                })


                ->addColumn('category_image', function ($row) {
                    if ($row->category_image) {
                        return '<img src="' . asset($row->category_image) . '" class="img-thumbnail" width="50">';
                    }
                    return '<span class="text-muted">No image</span>';
                })


                // Status column
                ->addColumn('status', function ($row) {
                    $badge = $row->status == '1'
                        ? '<span class="badge bg-success-subtle text-success">Active</span>'
                        : '<span class="badge bg-danger-subtle text-danger">Inactive</span>';
                    return $badge;
                })
                ->addColumn('language', function ($row) { // added new
                    return $row->language ? $row->language->name : 'No Language';
                })
                // Action buttons
                ->addColumn('action', function ($row) {
                    $editUrl = route('category.edit', $row->id);
                    $deleteUrl = route('category.destroy', $row->id);
                    $statusToggleUrl = route('category.Toggle.status', $row->id);
                    $checked = $row->status == 1 ? 'checked' : '';

                    return '
                            <div class="d-flex align-items-center gap-2">
                                <!-- Status Switcher -->
                                <div class="form-check form-switch">
                                    <input class="form-check-input status-toggle"
                                        type="checkbox"
                                        role="switch"
                                        data-id="' . $row->id . '"
                                        data-url="' . $statusToggleUrl . '"
                                        ' . $checked . '>
                                </div>

                            <!-- Edit Button -->
                            <a href="' . $editUrl . '" class="btn btn-ghost btn-icon btn-sm rounded-circle texttooltip" data-template="edit">
                                <svg xmlns="http://www.w3.org/2000/svg" class="feather feather-edit icon-xs" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                </svg>
                                <div id="edit" class="d-none"><span>Edit</span></div>
                            </a>

                            <!-- Delete Button -->
                            <button type="button" data-url="' . $deleteUrl . '" class="btn-delete btn btn-ghost btn-icon btn-sm rounded-circle texttooltip" data-template="trashTwo">
                                <svg xmlns="http://www.w3.org/2000/svg" class="feather feather-trash-2 icon-xs" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <polyline points="3 6 5 6 21 6"></polyline>
                                    <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                    <line x1="10" y1="11" x2="10" y2="17"></line>
                                    <line x1="14" y1="11" x2="14" y2="17"></line>
                                </svg>
                                <div id="trashTwo" class="d-none"><span>Delete</span></div>
                            </button>
                        </div>
                    ';
                })



                ->rawColumns(['checkbox', 'category_title', 'category_image', 'image', 'slug', 'status', 'action', 'language']) // added 'language' here
                ->make(true);
        }

        $languages = Language::all();

        return view('backend.layouts.category.index', compact('languages'));
    }

    public function generateUniqueSlug($name, $modelClass)
    {
        $slug = Str::slug($name);
        $originalSlug = $slug;
        $count = 2;

        while ($modelClass::where('slug', $slug)->exists()) {
            $slug = $originalSlug . '-' . $count;
            $count++;
        }

        return $slug;
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_title' => 'required|unique:categories,name|string|min:3',
            'category_image' => 'nullable|image|mimes:jpg,jpeg,png,svg|max:10240', // validate image
            'language_id' => 'required|exists:languages,id', // added new
        ]);

        if ($validator->fails()) {
            return redirect()
                ->back()
                ->withErrors($validator)
                ->withInput(); // keep old inputs
        }

        try {
            $imagePath = null;
            // Handle image if exists
            if ($request->hasFile('category_image')) {
                $image = $request->file('category_image');
                $imagePath = $this->uploadImage($image, null, 'uploads/category', 150, 150);
            }
            $uniqueSlug = $this->generateUniqueSlug($request->category_title, Category::class);
            // Save category
            Category::create([
                'name' => $request->category_title,
                // 'slug' => Str::slug($request->category_title),
                'slug' => $uniqueSlug,
                'category_image' => $imagePath,
                'language_id' => $request->language_id,  // added new
            ]);

            return redirect()
                ->route('category.index')
                ->with('success', 'Category created successfully');
        } catch (\Exception $e) {
            return redirect()
                ->back()
                ->with('error', $e->getMessage());
        }
    }



    public function edit($id)
    {

        if (!Category::find($id)) {
            return redirect()
                ->route('category.index')
                ->with('error', 'Category not found');
        }
        $category = Category::find($id);
        $languages = Language::all(); // added new
        return view('backend.layouts.category.index', compact('category', 'languages'));
    }


    public function update(Request $request, $id)
    {
        try {
            $category = Category::find($id);
            if (!$category) {
                return redirect()->route('category.index')->with('error', 'Category not found');
            }

            $imagePath = $category->category_image;

            if ($request->hasFile('category_image')) {
                $image = $request->file('category_image');
                // Pass old image to delete it
                $imagePath = $this->uploadImage($image, $category->category_image, 'uploads/category', 150, 150);
            }

            $category->update([
                'name' => $request->category_title,
                'slug' => Str::slug($request->category_title),
                'category_image' => $imagePath,
                'language_id' => $request->language_id,  // added new
            ]);

            return redirect()->route('category.index')->with('success', 'Category updated successfully');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }



    public function destroy($id)
    {
        $category = Category::find($id);

        if (!$category) {
            return redirect()
                ->route('category.index')
                ->with('error', 'Category not found');
        }

        try {
            // Save image path before deleting
            $imagePath = $category->category_image;

            // Delete the category
            $category->delete();

            // Delete the image file after model deleted
            $this->deleteImage($imagePath);

            return redirect()
                ->route('category.index')
                ->with('success', 'Category deleted successfully');
        } catch (\Exception $e) {
            return redirect()
                ->back()
                ->with('error', $e->getMessage());
        }
    }

    public function toggleStatus(Request $request, $id)
    {
        // dd('ok');
        $category = Category::findOrFail($id);
        $category->status = $request->status;
        $category->save();
        return $this->success([], 'Category status updated successfully', 200);
    }
}
