@extends('backend.master')

@section('title', 'Admin Settings')

@section('content')
    <div class="row mb-5">
        <div class="col-xl-9 col-lg-8 col-md-12 col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="mb-4">Company Settings</h4>

                    <!-- Admin Settings Form -->
                    <form method="POST" action="{{ route('admin.setting.update') }}" enctype="multipart/form-data">
                        @csrf

                        <!-- Title -->
                        <div class="mb-3 row">
                            <label for="title" class="col-sm-4 col-form-label text-start">Company Name</label>
                            <div class="col-md-8">
                                <input type="text" name="title" id="title" class="form-control"
                                    value="{{ $admin->title ?? '' }}" required>
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="mb-3 row">
                            <label for="email" class="col-sm-4 col-form-label text-start">Company Email</label>
                            <div class="col-md-8">
                                <input type="email" name="email" id="email" class="form-control"
                                    value="{{ $admin->email ?? '' }}" required>
                            </div>
                        </div>

                        <!-- Hotline -->
                        <div class="mb-3 row">
                            <label for="hotline" class="col-sm-4 col-form-label text-start"> Hotline / Phone</label>
                            <div class="col-md-8">
                                <input type="text" name="hotline" id="hotline" class="form-control"
                                    value="{{ $admin->hotline ?? '' }}" required>
                            </div>
                        </div>

                        <!-- Address -->
                        <div class="mb-3 row">
                            <label for="address" class="col-sm-4 col-form-label text-start">Company Address</label>
                            <div class="col-md-8">
                                <input type="text" name="address" id="address" class="form-control"
                                    value="{{ $admin->address ?? '' }}" required>
                            </div>
                        </div>

                        <!-- Logo -->
                        <div class="mb-3 row align-items-center">
                            <label for="logo" class="col-sm-4 col-form-label text-start">Company Logo</label>
                            <div class="col-md-8 d-flex gap-3 flex-wrap">
                                <input type="file" class="form-control w-50" name="logo" id="logo"
                                    onchange="previewImage(this, 'logoPreviewNew')">
                                <div class="rounded p-1">
                                    <img class="logoPreviewNew" src="#" alt="New Logo Preview"
                                        style="max-height: 60px; display:none;">
                                </div>
                                @if (!empty($admin->logo))
                                    <div class="rounded p-1">
                                        <img src="{{ asset($admin->logo) }}" style="max-height: 60px;">
                                    </div>
                                @endif
                            </div>
                        </div>

                        <!-- Favicon -->
                        {{-- <div class="mb-3 row align-items-center">
                            <label for="favicon" class="col-sm-4 col-form-label text-start">Favicon</label>
                            <div class="col-md-8 d-flex gap-3 flex-wrap">
                                <input type="file" class="form-control w-50" name="favicon" id="favicon"
                                    onchange="previewImage(this, 'faviconPreviewNew')">
                                <div class="rounded p-1">
                                    <img id="faviconPreviewNew" src="#" alt="New Favicon Preview"
                                        style="max-height: 60px; display:none;">
                                </div>
                                @if (!empty($admin->favicon))
                                    <div class="rounded p-1">
                                        <img src="{{ asset($admin->favicon) }}" alt="Current Favicon"
                                            style="max-height: 60px;">
                                    </div>
                                @endif
                            </div>
                        </div> --}}

                        <!-- Submit -->
                        <div class="text-end mt-4">
                            <button type="submit" class="btn btn-primary px-4">
                                <i class="bi bi-save me-1"></i> Update
                            </button>
                        </div>
                    </form>

                    <hr class="my-4">

                    <!-- Order Number -->
                    <h4 class="mb-4">Order Number</h4>
                    <form action="{{ route('set.invoice.number') }}" method="POST">
                        @csrf
                        <div class="mb-3 row">
                            <label for="invoice_number" class="col-sm-4 col-form-label text-start">Set Order Number</label>
                            <div class="col-md-8">
                                <input type="text" id="invoice_number" name="invoice_number" class="form-control"
                                    value="{{ $admin->invoice_number ?? '' }}" required>
                            </div>
                        </div>
                        <div class="text-end mt-2">
                            <button type="submit" class="btn btn-success px-4">
                                <i class="bi bi-plus-circle me-1"></i> Submit
                            </button>
                        </div>
                    </form>


                    <!-- Delivery Charge -->
                    <h4 class="mb-4">Delivery Charge</h4>
                    <form action="{{ route('set.delivery.charge') }}" method="POST">
                        @csrf
                        <div class="mb-3 row">
                            <label for="delivery_charge" class="col-sm-4 col-form-label text-start">Set Delivery
                                Charge</label>
                            <div class="col-md-8">
                                <input type="number" step="0.01" id="delivery_charge" name="delivery_charge"
                                    class="form-control" placeholder="Enter delivery charge"
                                    value="{{ $admin->delivery_charge ?? '' }}" required>
                            </div>
                        </div>
                        <div class="text-end mt-2">
                            <button type="submit" class="btn btn-success px-4">
                                <i class="bi bi-plus-circle me-1"></i> Submit
                            </button>
                        </div>
                    </form>
                    <!--Invoce setting -->
                    <h4 class="mb-4">Invoice Setting</h4>
                    <form action="{{ route('set.invoice.setting') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="mb-3 row">
                            <label for="title" class="col-sm-4 col-form-label text-start"> Invoice Title</label>
                            <div class="col-md-8">
                                <input type="text" name="title" id="title" class="form-control"
                                    value="{{ $InvoiceSetting->title ?? '' }}" required>
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="invoice_logo" class="col-sm-4 col-form-label text-start">Invoice Logo</label>
                            <div class="col-md-8">
                                <div class="col-md-8 d-flex gap-3 flex-wrap">
                                    <input type="file" class="form-control w-50" name="invoice_logo"
                                        id="invoice_logo" onchange="previewImage(this, 'invoice_logo')">
                                    <div class="rounded p-1">
                                        <img class="invoice_logo" src="#" alt="New Logo Preview"
                                            style="max-height: 60px; display:none;">
                                    </div>
                                    @if (!empty($InvoiceSetting->invoice_logo))
                                        <div class="rounded p-1">
                                            <img src="{{ asset($InvoiceSetting->invoice_logo ?? 'uploads/allurdevine.png') }}"
                                                style="max-height: 60px;">
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="text-end mt-2">
                            <button type="submit" value="invoice_setter" class="btn btn-success px-4">
                                <i class="bi bi-plus-circle me-1"></i> Submit
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        function previewImage(input, previewClass) {
            const file = input.files[0];
            const preview = document.querySelector("." + previewClass);

            if (file) {
                const reader = new FileReader();

                reader.onload = e => {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                };

                reader.readAsDataURL(file);
            } else {
                preview.src = '';
                preview.style.display = 'none';
            }
        }
    </script>
@endpush
