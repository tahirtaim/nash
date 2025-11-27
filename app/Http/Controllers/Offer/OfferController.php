<?php

namespace App\Http\Controllers\Offer;


use Carbon\Carbon;
use App\Models\Offer;
use App\Models\Product;
use App\Models\Language;
use App\Models\Newsletter;
use App\Jobs\NewsletterJob;
use App\Models\OfferProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Validator;

class OfferController extends Controller
{
    public function __construct()
    {
        // Protect only specific actions
        $this->middleware('permission:offer create')->only(['create', 'store  ']);
        $this->middleware('permission:offer view')->only(['index', 'show', 'changeStatus']);
        $this->middleware('permission:offer edit')->only(['edit', 'update']);
        $this->middleware('permission:offer delete')->only(['destroy']);
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            // $data = Offer::latest();
            $data = Offer::with('language')->latest();

            return DataTables::of($data)
                ->addIndexColumn()

                // Checkbox Column
                // ->addColumn('checkbox', function ($row) {
                //     return '<div class="form-check text-center">
                //     <input type="checkbox" class="form-check-input rowCheckbox" value="' . $row->id . '">
                // </div>';
                // })

                ->filter(function ($query) use ($request) {
                    if ($search = $request->input('search.value')) {
                        $query->where('offer_name', 'like', '%' . $search . '%')
                            ->orWhere('offer_percent', 'like', '%' . $search . '%')
                            ->orWhere('offer_start_date', 'like', '%' . $search . '%')
                            ->orWhere('offer_end_date', 'like', '%' . $search . '%');
                    }
                })

                // Offer Name Column
                ->addColumn('offer_name', function ($row) {
                    return '<div class="d-flex align-items-center">
                    <strong>' . e($row->offer_name) . '</strong>
                </div>';
                })

                // Offer Percent Column
                // ->addColumn('offer_percent', function ($row) {
                //     return '<span>' . e($row->offer_percent) . '%</span>';
                // })

                // // Product Name Column
                // ->addColumn('product_name', function ($row) {
                //     return $row->product->product_name ?? '<span class="text-muted">N/A</span>';
                // })

                // Offer Start Date
                ->addColumn('offer_start_date', function ($row) {
                    return '<span>' . e(Carbon::parse($row->offer_start_date)->format('d M Y')) . '</span>';
                })

                // Offer End Date
                ->addColumn('offer_end_date', function ($row) {
                    return '<span>' . e(Carbon::parse($row->offer_end_date)->format('d M Y')) . '</span>';
                })

                // Image Column
                ->addColumn('image', function ($row) {
                    if ($row->image) {
                        return '<img src="' . asset($row->image) . '" width="60">';
                    }
                    return '<span class="text-muted">No Image</span>';
                })

                // Status Column
                ->addColumn('status', function ($row) {
                    return $row->status == '1'
                        ? '<span class="badge bg-success">Published</span>'
                        : '<span class="badge bg-secondary">Draft</span>';
                })
                ->addColumn('language', function ($row) { // added new
                    return $row->language ? $row->language->name : 'No Language';
                })
                // Action Column
                ->addColumn('action', function ($row) {
                    $statusRoute = route('offer.status.change', [$row->id, $row->status == 1 ? 0 : 1]);
                    $checked = $row->status == 1 ? 'checked' : '';

                    return '
                        <td>
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

                                <a href="' . route('offer.show', $row->id) . '"
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
                                <a href="' . route('offer.edit', $row->id) . '"
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
                                <button type="button" data-url="' . route('offer.delete', $row->id) . '"
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
                        </td>';
                })

                ->rawColumns([
                    'checkbox',
                    'offer_name',
                    'product_name',
                    'offer_start_date',
                    'offer_end_date',
                    'image',
                    'status',
                    'action',
                    'language', // added new
                ])
                ->make(true);
        }
        $products = Product::select('id', 'product_name', 'regular_price', 'language_id')->get();
        $languages = Language::all();
        return view('backend.layouts.offer.index', compact('products', 'languages'));
    }

    /**
     * Show the form for creating a new resource.
     */

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {


        try {
            // 1. Validate the request
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
                'start_date' => 'required|date',
                'end_date' => 'required|date|after_or_equal:start_date',
                'products' => 'required|array',
                'products.*' => 'exists:products,id',
                'discount_type' => 'required|in:percent,fixed',
                'discount_value' => 'required|numeric|min:0',
                'total_cost' => 'required|numeric|min:0',
                'final_price' => 'required|numeric|min:0',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:2048',
                'description' => 'nullable|string',
                'language_id' => 'required|exists:languages,id', // added new
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator);
            }

            $imagePath = null;
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $imagePath = $this->uploadImage($image, null, 'uploads/offers', 820, 650);
            }

            DB::BeginTransaction();
            // dd($request->total_cost);
            $offer = Offer::create([
                'offer_name' => $request->name,
                'discount_type' => $request->discount_type,
                'discount_value' => $request->discount_value,
                'total_price' => $request->total_cost,
                'discount_price' => $request->final_price,
                'offer_start_date' => $request->start_date,
                'offer_end_date' => $request->end_date,
                'qty' => 1,
                'image' => $imagePath,
                'description' => $request->description,
                'language_id' => $request->language_id, // added new  
            ]);


            foreach ($request->products as $productId) {
                OfferProduct::create([
                    'offer_id' => $offer->id,
                    'product_id' => $productId,
                ]);
            }

            DB::commit();
            if ($request->send_to_newsletter == '1') {

                $newsletters = Newsletter::pluck('email')->toArray();

                NewsletterJob::dispatch($newsletters, $offer->id);
                return redirect()->back()->with('email_success', 'Offer created successfully and Mail sent to newsletter!');
            }

            return redirect()->back()->with('success', 'Offer created successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // $offer  = Offer::with('products')->find($id);
        $offer  = Offer::with(['products', 'language'])->find($id);
        return view('backend.layouts.offer.show', compact('offer'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        if (!Offer::find($id)) {
            return redirect()
                ->route('offer.index')
                ->with('error', 'Offer not found');
        }
        // $offer = Offer::find($id);
        $offer  = Offer::with(['products', 'language'])->find($id);
        $products = Product::select('id', 'product_name', 'regular_price', 'language_id')->get();
        $languages = Language::all(); // added new
        return view('backend.layouts.offer.edit', compact('offer', 'products', 'languages'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'offer_start_date' => 'required|date',
            'offer_end_date' => 'required|date|after_or_equal:start_date',
            'products' => 'required|array',
            'products.*' => 'exists:products,id',
            'discount_type' => 'required|in:percent,fixed',
            'discount_value' => 'required|numeric|min:0',
            'total_cost' => 'required|numeric|min:0',
            'final_price' => 'required|numeric|min:0',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:10240',
            'description' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator);
        }

        $offer = Offer::find($id);
        if (!$offer) {
            return redirect()->back()->with('error', 'Offer not found');
        }

        $imagePath = $offer->image;
        if ($request->hasFile('image')) {
            $imageFile = $request->file('image');
            $imagePath = $this->uploadImage($imageFile, $offer->image, 'uploads/offers', 150, 150);
        }

        $offer->update([
            'offer_name' => $request->name,
            'discount_type' => $request->discount_type,
            'discount_value' => $request->discount_value,
            'total_price' => $request->total_cost,
            'discount_price' => $request->final_price,
            'offer_start_date' => $request->offer_start_date,
            'offer_end_date' => $request->offer_end_date,
            'qty' => 1,
            'image' => $imagePath,
            'description' => $request->description,
            'language_id' => $request->language_id,  // added new
        ]);

        $syncData = [];
        foreach ($request->products ?? [] as $productId) {
            $syncData[$productId] = ['offer_id' => $offer->id, 'product_id' => $productId, 'created_at' => now(), 'updated_at' => now()];
        }

        $offer->products()->sync($syncData);


        return redirect()->route('offer.index')->with('success', 'Offer updated successfully!');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $offer = Offer::find($id);
        $this->deleteImage($offer->image);
        $offer->delete();
        return redirect()
            ->route('offer.index')
            ->with('success', 'Offer deleted successfully');
    }


    public function changeStatus($id, $status)
    {
        $offer = Offer::find($id);
        $offer->status = $status;
        $offer->save();
        return redirect()->back()->with('success', 'Offer status updated successfully');
    }

    public function loadProducts(Request $request)
    {
        // return response()->json(['status' => 'success']);
        $language_id = $request->input('language_id');
        $products = Product::where('language_id', $language_id)->get();
        // dd($products);
        return response()->json(['products' => $products]);
    }
}
