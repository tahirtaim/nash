@extends('backend.master')

@section('title', 'Newsletter')
@push('styles')
    <style>
        /* Align the entire pagination to the right */
        #newsletterTable_paginate {
            float: right !important;
        }

        /* Align info text (optional) to left or center */
        #newsletterTable_info {
            float: left;
            margin-top: 8px;
        }

        /* Clear floats for the table footer row */
        .dataTables_wrapper .dataTables_paginate,
        .dataTables_wrapper .dataTables_info {
            display: inline-block;
        }
    </style>
@endpush

@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <div class="mb-5">
                <h3 class="mb-0">Newsletter</h3>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-6 col-12">
            <div class="card shadow-sm mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Newsletter List</h5>
                    <div id="newsletterButtons"></div>
                </div>
                <div class="card-body">
                    <div class="table-responsive table-card">
                        <table id="newsletterTable"
                            class="table table-striped table-hover align-middle text-nowrap table-centered mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>
                                    </th>
                                    <th>#</th>
                                    <th>Email</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6 col-12">
            <div class="card shadow-sm mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Get in touch List</h5>
                    <div id="newsletterButtons"></div>
                </div>
                <div class="card-body">
                    <div class="table-responsive table-card">
                        <table id="newsletterTable"
                            class="table table-striped table-hover align-middle text-nowrap table-centered mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>full Name</th>
                                    <th>Subject</th>
                                    <th>Email</th>
                                    <th>Comment</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($getInTouch as $item)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $item->full_name }}</td>
                                        <td>{{ $item->subject }}</td>
                                        <td>{{ $item->email_address }}</td>
                                        <td>{{ $item->comment }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>

                        <div class="mt-3">
                            {{ $getInTouch->links('pagination::bootstrap-5') }}
                        </div>
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
            let table = $('#newsletterTable').DataTable({
                processing: true,
                serverSide: true,
                searching: true,
                ordering: false,
                paging: true,
                lengthChange: true,
                info: true,
                ajax: "{{ route('get.newsletter.index') }}",
                columns: [{
                        data: 'checkbox',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'email'
                    },
                    {
                        data: 'action',
                        orderable: false,
                        searchable: false
                    }
                ],
                language: {
                    searchPlaceholder: "Search data...",
                    search: "",
                    paginate: {
                        previous: "Previous",
                        next: "Next"
                    },
                    info: "Showing _START_ to _END_ of _TOTAL_ entries",
                    infoEmpty: "No records available",
                    lengthMenu: "Show _MENU_ entries per page",
                    processing: "Loading..."
                },
                dom: 'Bfrtip',
                buttons: [{
                        extend: 'csv',
                        text: '<i class="bi bi-file-earmark-spreadsheet me-1"></i> CSV',
                        className: 'btn btn-success btn-sm me-2',
                        title: 'Newsletter List'
                    },
                    {
                        extend: 'excel',
                        text: '<i class="bi bi-file-earmark-excel me-1"></i> Excel',
                        className: 'btn btn-primary btn-sm me-2',
                        title: 'Newsletter List'
                    },
                    {
                        extend: 'print',
                        text: '<i class="bi bi-printer me-1"></i> Print',
                        className: 'btn btn-warning btn-sm',
                        title: 'Newsletter List'
                    }
                ],
                initComplete: function() {
                    table.buttons().container().appendTo('#newsletterButtons');
                }
            });
        });
    </script>
@endpush
