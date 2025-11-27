@extends('backend.master')

@section('title', 'Promo Code')

@push('styles')
    <!-- Optional Custom Style -->
    <style>
        #exampleModal .modal-content {
            background-color: #fff;
            font-family: 'Inter', sans-serif;
        }

        #exampleModal .modal-header h6 {
            font-size: 0.95rem;
            letter-spacing: 0.3px;
        }

        #exampleModal .modal-body {
            font-size: 0.9rem;
        }

        #exampleModal .text-success {
            color: #16a34a !important;
            /* nice green tone */
        }

        .row {
            font-size: 0.6rem;
        }
    </style>
@endpush

@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <!-- Page header -->
            <div class="mb-5">
                <h3 class="mb-0"> Promo Code</h3>
            </div>
        </div>
    </div>
    <div class="row">

        <!-- Promo Code List -->
        <div class="col-lg-8 col-12">
            <div class="card mb-4">
                <div class="card">
                    <div class="card-header d-md-flex border-bottom-0">
                        <div class="flex-grow-1">
                            <label class="form-label fw-bold">Promo Code List</label>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table-card">
                            <table id="promoTable"
                                class="table table-striped table-hover align-middle text-nowrap table-centered mt-0"
                                style="width: 100%;">
                                <thead class="table-light">
                                    <tr>
                                        <th>#</th>
                                        <th>Code</th>
                                        <th>Value</th>
                                        <th>Min Amount</th>
                                        <th>Max Uses</th>
                                        <th>Total Users</th>
                                        <th>Expires</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    @forelse($promos as $index => $promo)
                                        <tr>
                                            <td>{{ $index + 1 }}</td>
                                            <td>{{ $promo->code }}</td>
                                            <td>{{ $promo->value }}</td>
                                            <td>{{ $promo->min_order_amount }}</td>
                                            <td>{{ $promo->max_uses ?? 'Unlimited' }}</td>
                                            <td>{{ $promo->max_users ?? 'Unlimited' }}</td>
                                            <td>{{ $promo->expires_at ? $promo->expires_at->format('d M Y') : 'No Expiry' }}
                                            </td>
                                            <td>
                                                @if ($promo->status == 1)
                                                    <span class="badge bg-success">Active</span>
                                                @else
                                                    <span class="badge bg-danger">Inactive</span>
                                                @endif
                                            </td>
                                            <td>


                                                <button type="button" class="btn btn-sm view-promo btn-info"
                                                    data-bs-toggle="modal" data-bs-target="#exampleModal"
                                                    data-id="{{ $promo->id }}" data-code="{{ $promo->code }}">
                                                    view
                                                </button>

                                                <!-- Status Toggle Button -->
                                                <form action="{{ route('promocode.toggleStatus', $promo->id) }}"
                                                    method="POST" style="display:inline-block;">
                                                    @csrf
                                                    @method('PATCH')
                                                    <button type="submit"
                                                        class="btn btn-sm {{ $promo->status == 1 ? 'btn-warning' : 'btn-success' }}">
                                                        {{ $promo->status == 1 ? 'Inactive' : 'Active' }}
                                                    </button>
                                                </form>

                                                <a href="{{ route('promocode.edit', $promo->id) }}"
                                                    class="btn btn-sm btn-primary">Edit</a>

                                                <form action="{{ route('promocode.destroy', $promo->id) }}" method="POST"
                                                    class="d-inline deleteForm">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="button"
                                                        class="btn btn-sm btn-danger deleteBtn">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="9" class="text-center">No Promo Codes Found</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <!-- Promo Details Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog  modal-dialog-top"> <!-- small, centered modal -->
                <div class="modal-content border-0 shadow-sm rounded-3">

                    <!-- Header -->
                    <div class="modal-header border-0 pb-0">
                        <h6 class="modal-title fw-semibold text-secondary">
                            Promo Code: <span id="modalCode" class="text-dark"></span>
                        </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- Body -->
                    <div class="modal-body pt-2">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class="text-muted small">Total Users</span>
                            <span id="modalUser" class="fw-semibold text-dark">0</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted small">Total KD</span>
                            <span id="modalTotal" class="fw-semibold text-success">0.00</span>
                        </div>
                    </div>

                </div>
            </div>
        </div>





        <!-- Promo Code Form -->
        <div class="col-lg-4 col-12">
            <form action="{{ isset($promocode) ? route('promocode.update', $promocode->id) : route('promocode.store') }}"
                method="POST">
                @csrf
                @if (isset($promocode))
                    @method('PUT')
                @endif

                <div class="card shadow-sm mb-4">
                    <div class="card-header  text-white text-center">
                        <h5 class="mb-0">
                            @if (isset($promocode))
                                <i class="bi bi-pencil-square me-2"></i> Edit Promo Code
                            @else
                                <i class="bi bi-plus-circle me-2"></i> Add Promo Code
                            @endif
                        </h5>
                    </div>

                    <div class="card-body">
                        {{-- Promo Code --}}
                        <div class="mb-3">
                            <label class="form-label">Promo Code</label>
                            <input type="text" name="code" value="{{ isset($promocode) ? $promocode->code : '' }}"
                                class="form-control" placeholder="Enter Promo Code">
                            @error('code')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Discount Type --}}
                        <div class="mb-3">
                            <label class="form-label">Discount Type</label>
                            <select name="type" class="form-control">
                                <option value="fixed"
                                    {{ isset($promocode) && $promocode->type == 'fixed' ? 'selected' : '' }}>Fixed</option>
                                <option value="percent"
                                    {{ isset($promocode) && $promocode->type == 'percent' ? 'selected' : '' }}>Percent
                                </option>
                            </select>
                            @error('type')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Discount Value --}}
                        <div class="mb-3">
                            <label class="form-label">Discount Value</label>
                            <input type="number" step="0.01" name="value"
                                value="{{ isset($promocode) ? $promocode->value : '' }}" class="form-control"
                                placeholder="Enter Discount Value">
                            @error('value')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Minimum Order Amount --}}
                        <div class="mb-3">
                            <label class="form-label">Minimum Order Amount</label>
                            <input type="number" step="0.01" name="min_order_amount"
                                value="{{ isset($promocode) ? $promocode->min_order_amount : '' }}" class="form-control"
                                placeholder="Enter Min Order Amount">
                            @error('min_order_amount')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Max Uses --}}
                        <div class="mb-3">
                            <label class="form-label">Max Uses</label>
                            <input type="number" name="max_uses"
                                value="{{ isset($promocode) ? $promocode->max_uses : '' }}" class="form-control"
                                placeholder="Enter Max Uses">
                            @error('max_uses')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Total Users --}}
                        <div class="mb-3">
                            <label class="form-label">Total Users</label>
                            <input type="number" name="max_users"
                                value="{{ isset($promocode) ? $promocode->max_users : '' }}" class="form-control"
                                placeholder="Enter Total Users Limit">
                            @error('max_users')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Expiry Date --}}
                        <div class="mb-3">
                            <label class="form-label">Expiry Date</label>
                            <input type="date" name="expires_at"
                                value="{{ isset($promocode) && $promocode->expires_at ? $promocode->expires_at->format('Y-m-d') : '' }}"
                                class="form-control">
                            @error('expires_at')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Status --}}
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select name="status" class="form-control">
                                <option value="1"
                                    {{ isset($promocode) && $promocode->status == 1 ? 'selected' : '' }}>Active</option>
                                <option value="0"
                                    {{ isset($promocode) && $promocode->status == 0 ? 'selected' : '' }}>Inactive</option>
                            </select>
                            @error('status')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Submit Button --}}
                        <div class="d-grid">
                            @if (isset($promocode))
                                <button class="btn btn-success mb-4">Update</button>
                                <a href="{{ route('promocode.index') }}" class="btn btn-secondary">Back</a>
                            @else
                                <button class="btn btn-success mb-4">Create</button>
                            @endif
                        </div>
                    </div>
                </div>
            </form>
        </div>


    </div>
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const deleteButtons = document.querySelectorAll(".deleteBtn");

            deleteButtons.forEach(function(button) {
                button.addEventListener("click", function(e) {
                    const form = this.closest("form");

                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            form.submit();
                        }
                    });
                });
            });
        });
    </script>

    <script>
        $(document).on('click', '.view-promo', function(e) {
            e.preventDefault();

            const id = $(this).data('id');
            const code = $(this).data('code');
            $.ajax({
                url: "{{ route('promocode.show') }}",
                method: 'GET',
                data: {
                    id: id,
                    code: code
                },
                success: function(response) {
                    // Assuming the response contains 'user' and 'total'
                    const user = response.user;
                    const total = response.total;

                    // Update the modal content
                    $('#modalUser').html(user);
                    $('#modalTotal').html(total);
                    $('#modalCode').html(response.promocode);

                },
                error: function(xhr, status, error) {
                    // Handle error
                    console.error('Error:', error);
                }
            });

        });
    </script>
@endpush
