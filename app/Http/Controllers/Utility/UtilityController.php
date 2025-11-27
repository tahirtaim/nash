<?php

namespace App\Http\Controllers\Utility;

use App\Models\Newsletter;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\GetInTouch;
use Yajra\DataTables\Facades\DataTables;

class UtilityController extends Controller
{
    public function __construct()
    {
        // Protect only specific actions
        $this->middleware('permission:newsletter management')->only(['newsletter', 'newsletterDelete']);
    }
    public function newsletter(Request $request)
    {
        $getInTouch = GetInTouch::latest()->paginate(10);
        if ($request->ajax()) {
            $data = Newsletter::latest();

            return DataTables::of($data)
                ->addIndexColumn()
                ->filter(function ($query) use ($request) {
                    if ($search = $request->input('search.value')) {
                        $query->where(function ($q) use ($search) {
                            $q->where('email', 'like', "%{$search}%");
                        });
                    }
                })

                // Checkbox column
                ->addColumn('checkbox', function ($row) {
                    return '<div class="form-check text-center">
                            <input type="checkbox" class="form-check-input rowCheckbox" value="' . $row->id . '">
                        </div>';
                })


                // Category Title
                ->addColumn('email', function ($row) {
                    return '<div class="d-flex align-items-center">

                            <strong>' . e($row->email) . '</strong>
                        </div>';
                })

                // Action buttons
                ->addColumn('action', function ($row) {
                    $deleteUrl = route('newsletter.delete', $row->id);
                    // $statusToggleUrl = route('newsletter.delete', $row->id);
                    // $checked = $row->status == 1 ? 'checked' : '';

                    return '
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

                ->rawColumns(['checkbox', 'email', 'action'])
                ->make(true);
        }

        return view('backend.layouts.newsletter.index', compact('getInTouch'));
    }

    public function newsletterDelete($id)
    {
        $newsletter  = Newsletter::find($id);

        if ($newsletter) {
            $newsletter->delete();

            return back()->with('success', 'Newsletter successfully deleted');
        }


        return back()->with('success', 'Newsletter not available');
    }
}
