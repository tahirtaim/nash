<?php

namespace App\Http\Controllers\Order;

use Exception;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Inventory;
use App\Traits\ApiResponse;
use App\Models\AdminSetting;
use Illuminate\Http\Request;
use App\Models\OrderItemDetail;
use Barryvdh\DomPDF\Facade\Pdf;
use Hesabe\Payment\HesabeCrypt;
use App\Models\OrderBillingInfo;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class OrderController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $query = Order::with(['user', 'items', 'billing'])->select('orders.*')->latest();

            // Filtering before get()
            if ($request->filled('status')) {
                $query->where('status', $request->status);
            }

            if ($request->filled('payment_status')) {
                $query->where('payment_status', $request->payment_status);
            }

            if ($request->filled('payment_method')) {
                $query->where('payment_method', $request->payment_method);
            }

            return DataTables::of($query)
                ->addIndexColumn()
                ->addColumn('order_number', fn($row) => '<a href="' . route('order.invoiceshow', $row->order_number) . '" class="fw-bold">' . $row->order_number . '</a>')
                ->addColumn('customer_info', function ($row) {
                    $name = $row->billing->name ?? '';
                    $email = $row->billing->email ?? '';
                    $phone = $row->billing->phone ?? '';
                    return "<span class='fw-bold'>{$name}</span><br> <span class='fw-bold'>{$phone}</span><br>";
                })
                ->addColumn('billing_info', fn($row) => '<span class="fw-bold">' . ($row->billing->address ?? '') . '</span>')
                ->addColumn('subtotal', fn($row) => 'KWD ' . number_format($row->sub_total, 2))
                ->addColumn('shipping', fn($row) => 'KWD ' . number_format($row->shipping_cost, 2))
                ->addColumn('total', fn($row) => 'KWD ' . number_format($row->total_amount, 2))
                ->addColumn('payment_method', fn($row) => strtoupper($row->payment_method))
                ->addColumn('payment_status', function ($row) {
                    if ($row->payment_status == 'completed') {
                        return '<span class="badge bg-success"> Paid </span>';
                    }
                    if ($row->payment_status == 'pending') {
                        return '<span class="badge bg-danger"> Unpaid </span>';
                    }
                    return '<span class="badge bg-warning"> Cancelled </span>';
                })
                ->addColumn('status', function ($row) {
                    $status = $row->status;
                    $colors = [
                        'pending' => 'warning',
                        'received' => 'info',
                        'shipped' => 'secondary',
                        'delivered' => 'success',
                        'cancelled' => 'danger',
                    ];
                    $color = $colors[$status] ?? 'secondary';
                    return "<span class='badge bg-{$color}'>{$status}</span>";
                })
                ->addColumn('action', function ($row) {
                    $html = '<a href="' . route('order.invoiceshow', $row->order_number) . '" class="btn btn-sm btn-primary me-2"><i class="fas fa-print"></i></a>';
                    $invoice = '<a href="' . route('download.pdf', $row->order_number) . '" class="btn btn-sm btn-dark me-2"><i class="fas fa-download"></i></a>';
                    $btns = '';

                    // ✅ Only show status buttons for COD orders
                    if ($row->payment_method === 'cod') {
                        if ($row->status === 'pending') {
                            $btns .= '<a href="' . route('order.updatestatus', ['id' => $row->id, 'status' => 'received']) . '" class="btn btn-sm btn-success mx-1">Accept</a>';
                            $btns .= '<a href="' . route('order.updatestatus', ['id' => $row->id, 'status' => 'cancelled']) . '" class="btn btn-sm btn-danger mx-1">Cancel</a>';
                        } elseif ($row->status === 'received') {
                            $btns .= '<a href="' . route('order.updatestatus', ['id' => $row->id, 'status' => 'shipped']) . '" class="btn btn-sm btn-info mx-1">Shipped</a>';
                            $btns .= '<a href="' . route('order.updatestatus', ['id' => $row->id, 'status' => 'cancelled']) . '" class="btn btn-sm btn-danger mx-1">Cancel</a>';
                        } elseif ($row->status === 'shipped') {
                            $btns .= '<a href="' . route('order.updatestatus', ['id' => $row->id, 'status' => 'delivered']) . '" class="btn btn-sm btn-info mx-1">Confirm Delivery</a>';
                            $btns .= '<a href="' . route('order.updatestatus', ['id' => $row->id, 'status' => 'cancelled']) . '" class="btn btn-sm btn-danger mx-1">Cancel</a>';
                        } elseif ($row->status === 'cancelled') {
                            $btns .= '<a href="' . route('order.updatestatus', ['id' => $row->id, 'status' => 'pending']) . '" class="btn btn-sm btn-warning mx-1">Pending</a>';
                        }
                    }

                    return $invoice . $html . $btns;
                })
                ->rawColumns(['action', 'customer_info', 'billing_info', 'payment_status', 'status', 'order_number', 'subtotal', 'shipping', 'total', 'payment_method'])
                ->make(true);
        }

        return view('backend.layouts.order.index');
    }


    public function invoiceshow(string $id)
    {
        $order = Order::with(['user', 'items.product', 'billing',])->select('orders.*')->where('order_number', $id)->first();

        return view('backend.layouts.invoice.invoice', compact('order'));
    }
    public function updatestatus($id, $status)
    {
        $order = Order::find($id);
        $order->status = $status;

        if ($status == 'delivered') {
            $order->is_paid = 1;
            $order->payment_status = 'completed';
            $order->delivered_at = now();
        }
        $order->save();
        return redirect()->back()->with('success', 'Order status updated successfully');
    }

    public function accept($id, $status)
    {
        $order = Order::find($id);
        $order->status = $status;
        $order->save();
        return redirect()->back()->with('success', 'Order status updated successfully');
    }

    public function reject($id, $status)
    {
        $order = Order::find($id);
        $order->status = $status;
        $order->save();
        return redirect()->back()->with('success', 'Order status updated successfully');
    }

    // invoixe download
    public function downloadPDF($id)
    {
        $order = Order::with(['user', 'items.product', 'billing',])->select('orders.*')->where('order_number', $id)->first();
        // Load a view into the PDF
        $pdf = Pdf::loadView('backend.layouts.invoice.download', ['title' => 'Product invoice', 'order' => $order,]);

        return $pdf->download('invoice.pdf');
    }

    public function callback(Request $request)
    {
        $encrypted = $request->input('data') ?? $request->post('data') ?? null;
        if (!$encrypted) return response()->json(['status' => false, 'message' => 'No data received'], 400);

        $decrypted = HesabeCrypt::decrypt($encrypted, env('HESABE_SECRET_KEY'), env('HESABE_IV_KEY'));
        if (!$decrypted) return response()->json(['status' => false, 'message' => 'Invalid payload'], 400);

        $payload = json_decode($decrypted, true);

        // Payment details are inside "response"
        $responseData = data_get($payload, 'response', $payload);

        $resultCode = data_get($responseData, 'resultCode', data_get($responseData, 'status'));
        $orderRef   = data_get($responseData, 'orderReferenceNumber');

        // dd($payload);
        $order = Order::where('order_number', $orderRef)->first();
        if (!$order) return response()->json(['status' => false, 'message' => 'Order not found'], 404);

        // If already paid, skip
        if ($order->is_paid) {
            return response()->json(['status' => true, 'message' => 'Already processed'], 200);
        }

        if (in_array($resultCode, ['CAPTURED', 'ACCEPT', 'SUCCESS'])) {
            DB::beginTransaction();
            try {
                // Mark order as paid
                $order->update([
                    'is_paid' => true,
                    'payment_status' => 'completed',
                    'status' => 'completed',
                ]);

                // Decrement inventory
                foreach ($order->items as $item) {
                    $inventory = Inventory::where('product_id', $item->product_id)->first();
                    if ($inventory && $item->quantity <= $inventory->quantity) {
                        $inventory->decrement('quantity', $item->quantity);
                    } else {
                        DB::rollBack();
                        return response()->json([
                            'status' => false,
                            'message' => 'Product out of stock for product ID: ' . $item->product_id
                        ], 409);
                    }
                }

                DB::commit();

                $order = Order::where('order_number', $orderRef)->first();
                $userId = $order->user_id;

                $cart_items = Cart::where('user_id', $userId)->get();

                if ($cart_items->isEmpty()) {
                    return $this->error([], 'Cart not found!', 404);
                }

                foreach ($cart_items as $cart) {
                    $cart->delete();
                }

                return view('backend.layouts.success-popup', [
                    'redirectUrl' => 'https://mohammednash-beta.vercel.app/profile',
                    'shop'=>'https://mohammednash-beta.vercel.app/products'
                    
                ]);
            } catch (Exception $e) {
                DB::rollBack();
                return response()->json([
                    'status' => false,
                    'message' => 'Server Error: ' . $e->getMessage()
                ], 500);
            }
        }


        // Payment failed
        $order->update(['payment_status' => 'failed']);
        return $this->success($order, 'Payment  successfull ', 200);
    }



    public function failed()
    {
        return view('backend.layouts.failed-popup', [
            'redirectUrl' => 'https://mohammednash-beta.vercel.app/checkout'
        ]);
    }

    public function successPopup()
    {
        return view(
            'backend.layouts.cashOnDeliverySuccess',
            [
                'redirectUrl' => 'https://mohammednash-beta.vercel.app/profile',
                'shop' => 'https://mohammednash-beta.vercel.app/products'

            ]
        );
    }
}
