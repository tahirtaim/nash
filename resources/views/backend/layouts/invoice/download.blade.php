<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Invoice</title>
    <style>
        @page {
            size: A4;
            margin: 5mm;
        }

        body {
            font-family: 'DejaVu Sans', sans-serif;
            font-size: 12px;
            color: #555;
            margin: 0;
            padding: 0;
        }

        .invoice-box {
            width: 200mm;
            min-height: 270mm;
            margin: auto;
            background: #ffffff;
            padding: 10px;
            box-sizing: border-box;
        }

        .brand-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .brand img {
            height: 200px;
        }

        .invoice-info {
            text-align: right;
        }

        .invoice-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
        }

        .invoice-number {
            font-size: 16px;
            color: #777;
        }

        .details {
            margin-top: 10px;
            border: 1px dotted #444;
            border-collapse: collapse;
            width: 100%;
        }

        .details td {
            border: 1px dotted #444;
            padding: 8px 12px;
            vertical-align: top;
            font-size: 12px;
        }

        .details .label {
            font-weight: bold;
        }

        .balance {
            margin-top: 15px;
            text-align: right;
            font-size: 14px;
            font-weight: bold;
            color: #000;
        }

        .items {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .items th {
            background: #333;
            color: #fff;
            padding: 6px;
            text-align: center;
            font-size: 12px;
        }

        .items td {
            border: 1px solid #000;
            padding: 6px;
            text-align: center;
            font-size: 12px;
        }

        .totals {
            margin-top: 20px;
            margin-bottom: 60px;
            width: 45%;
            margin-left: auto;
            border: 1px dotted #444;
            border-collapse: collapse;
        }

        .totals td {
            padding: 6px;
            font-size: 12px;
            border-bottom: 1px dotted #444;
        }

        .totals td:last-child {
            text-align: right;
        }

        .totals tr:last-child td {
            border-bottom: none;
        }

        .received {
            margin-top: 40px;
            font-size: 14px;
        }

        .note {
            margin-top: 15px;
            font-size: 11px;
            font-style: italic;
        }

        .footer {
            margin-top: 25px;
            font-size: 11px;
            text-align: center;
            color: #000;
            line-height: 1.4;
        }
    </style>
</head>

<body>
    <div class="invoice-box">

        <!-- Brand / Company Logo + Invoice Info -->
        <div class="brand-header">
            <div class="brand">
                <img src="{{ $admin_setting->logo ? public_path($invoice_settings->invoice_logo) : public_path('uploads/default.png') }}"
                    alt="Company Logo" style="height: 150px;">
            </div>
            <div class="invoice-info">
                <div class="invoice-title">INVOICE</div>
                <div class="invoice-number"># {{ $order->order_number ?? 'N/A' }}</div>
            </div>
        </div>

        <!-- Company & Invoice details -->
        <table class="details">
            <tr>
                <td colspan="2" class="label">{{ $invoice_settings->title ?? 'Company Name' }}</td>
                <td>Date:</td>
                <td>{{ $order->created_at ? $order->created_at->format('d M, Y') : now()->format('d M, Y') }}</td>
            </tr>
            <tr>
                <td class="label">Invoice To:</td>
                <td>{{ $order->billing->name ?? 'N/A' }}</td>
                <td>Payment Terms:</td>
                <td>{{ $order->payment_terms ?? 'Consignment' }}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>PO Number:</td>
                <td>{{ $order->po_number ?? 'N/A' }}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>Dispatch Date:</td>
                <td>{{ $order->dispatch_date ? $order->dispatch_date->format('d M, Y') : now()->format('d M, Y') }}</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>Currency:</td>
                <td>KWD</td>
            </tr>
        </table>

        <!-- Balance -->
        <div class="balance">
            Balance Due: KWD {{ number_format($order->total_amount ?? 0, 3) }}
        </div>

        <!-- Items -->
        <table class="items">
            <tr>
                <th>Item description</th>
                <th>Unit</th>
                <th>Quantity</th>
                <th>Unit price</th>
                <th>Value</th>
            </tr>
            @forelse ($order->items as $item)
                <tr>
                    <td style="text-align:left">{{ $item->product->product_name ?? 'Unnamed Product' }}</td>
                    <td>{{ $item->product->unit ?? 'pcs' }}</td>
                    <td>{{ $item->quantity ?? 0 }}</td>
                    <td>{{ number_format($item->product->regular_price ?? 0, 3) }}</td>
                    <td>{{ number_format(($item->product->regular_price ?? 0) * ($item->quantity ?? 0), 3) }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="5">No items found</td>
                </tr>
            @endforelse
        </table>

        <!-- Totals -->
        <table class="totals">
            <tr>
                <td>Gross total:</td>
                <td>{{ number_format($order->sub_total ?? 0, 3) }}</td>
            </tr>
            <tr>
                <td>Discount:</td>
                <td>{{ number_format($order->discount_amount ?? 0, 3) }}</td>
            </tr>
            <tr>
                <td>Net Total:</td>
                <td>{{ number_format($order->total_amount ?? 0, 3) }}</td>
            </tr>
            <tr>
                <td>Kuwaiti Dinar:</td>
                <td>{{ $order->total_amount_words ?? '' }}</td>
            </tr>
        </table>

        {{-- <!-- Received -->
        <div class="received">
            <strong>Received by:</strong> ..................................
        </div>

        <!-- Note -->
        <div class="note">
            * Client must notify us in writing of any products with less than three (3) months remaining shelf life
            prior
            to their expiration date.
        </div> --}}

        <!-- Footer -->
        <div class="footer">
            {{ $admin_setting->address ?? 'Company Address' }} |
            {{ $admin_setting->hotline ?? 'Hotline: 0000' }} |
            {{ $admin_setting->email ?? 'company@email.com' }}
        </div>
    </div>
</body>

</html>
