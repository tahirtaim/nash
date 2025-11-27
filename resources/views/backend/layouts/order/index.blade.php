@extends('backend.master')

@push('styles')
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" rel="stylesheet">
    {{-- Font Awesome Icons --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
@endpush

@section('title', 'Orders')

@section('content')
    <!-- Page Title -->
    <div class="row">
        <div class="col-lg-12">
            <div class="mb-4">
                <h3 class="mb-0">Orders</h3>
            </div>
        </div>
    </div>

    <!-- Order Table Card -->
    <div class="row">
        <div class="col-lg-12">
            <div class="card shadow-sm border-0 rounded-4 mb-4">

                <!-- Card Header: Filters -->
                <div class="card-body border-bottom pb-3">
                    <div class="row g-3 align-items-end">
                        <div class="col-md-3">
                            <label for="statusFilter" class="form-label fw-semibold">Order Status</label>
                            <select id="statusFilter" class="form-select shadow-sm">
                                <option value="">All</option>
                                <option value="pending">Pending</option>
                                <option value="shipped">Shipped</option>
                                <option value="received">Received</option>
                                <option value="delivered">Delivered</option>
                                <option value="cancelled">Cancelled</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="paymentStatusFilter" class="form-label fw-semibold">Payment Status</label>
                            <select id="paymentStatusFilter" class="form-select shadow-sm">
                                <option value="">All</option>
                                <option value="pending">Unpaid</option>
                                <option value="completed">Paid</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="paymentMethodFilter" class="form-label fw-semibold">Payment Method</label>
                            <select id="paymentMethodFilter" class="form-select shadow-sm">
                                <option value="">All</option>
                                <option value="cod">Cash on delivery</option>
                                <option value="hesabe">Hesabe</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Card Body: Table -->
                <div class="card-body pt-0">
                    <div class="table-responsive">
                        <table id="orderTable" class="table table-hover table-striped align-middle text-center mb-0">
                            <thead class="table-light text-uppercase small text-secondary">
                                <tr>
                                    {{-- <th>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="checkAll">
                                        </div>
                                    </th> --}}
                                    <th>#</th>
                                    <th>Order No</th>
                                    <th>Customer Info</th>
                                    <th>Billing Info</th>
                                    <th>Subtotal</th>
                                    <th>Delivery Charge</th>
                                    <th>Total</th>
                                    <th>Payment Method</th>
                                    <th>Payment Status</th>
                                    <th>Order Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{-- Dynamic rows will be inserted here --}}
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>

@endsection

@push('scripts')
    <script>
        $(document).ready(function() {
            // Check if already initialized
            if ($.fn.DataTable.isDataTable('#orderTable')) {
                $('#orderTable').DataTable().destroy();
            }

            // Now initialize safely
            let table = $('#orderTable').DataTable({
                processing: true,
                serverSide: true,
                searching: false,

                ajax: {
                    url: "{{ route('order.index') }}",
                    data: function(d) {
                        d.status = $('#statusFilter').val();
                        d.payment_status = $('#paymentStatusFilter').val();
                        d.payment_method = $('#paymentMethodFilter').val();
                    }
                },
                columns: [
                    // {
                    //     data: 'checkbox',
                    //     name: 'checkbox',
                    //     orderable: false,
                    //     searchable: false
                    // },
                    {
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'order_number',
                        name: 'order_number'
                    },
                    {
                        data: 'customer_info',
                        name: 'customer_info',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'billing_info',
                        name: 'billing_info',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'subtotal',
                        name: 'subtotal'
                    },
                    {
                        data: 'shipping',
                        name: 'shipping'
                    },
                    {
                        data: 'total',
                        name: 'total'
                    },
                    {
                        data: 'payment_method',
                        name: 'payment_method'
                    },
                    {
                        data: 'payment_status',
                        name: 'payment_status',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'status',
                        name: 'status',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    },
                ],

            });

            // Filter Reload
            $('#statusFilter, #paymentStatusFilter, #paymentMethodFilter').on('change', function() {
                table.ajax.reload();
            });

        });
    </script>
@endpush
