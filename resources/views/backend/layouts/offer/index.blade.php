@extends('backend.master')

@section('title', 'Offer')

@section('content')
    <div class="row">
        <div class="col-12 mb-4">
            <h3 class="mb-0">Offer Management</h3>
        </div>
        @if (session('email_success'))
            <div class="alert alert-info alert-dismissible fade show" role="alert" id="emailSuccessAlert">
                {{ session('email_success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif
    </div>

    <div class="row">
        {{-- Offer List --}}
        <div class="col-lg-7 col-12">
            <div class="card mb-4 shadow-sm">
                <div class="card-header  text-white">
                    <h5 class="mb-0">Offer List</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="offerTable"
                            class="table table-striped table-hover align-middle text-nowrap table-centered">
                            <thead class="table-light">
                                <tr>
                                    {{-- <th><input class="form-check-input" type="checkbox" id="checkAll"></th> --}}
                                    <th>#</th>
                                    <th>Offer Name</th>
                                    {{-- <th>Offer %</th> --}}
                                    {{-- <th>Product</th> --}}
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Image</th>
                                    <th>Language</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        {{-- Offer Form --}}
        <div class="col-lg-5 col-12">
            <div class="card shadow-sm">
                <div class="card-header  text-white">
                    <h5 class="mb-0">Create New Offer</h5>
                </div>
                <div class="card-body form-direction" dir="{{ session('language_id') == 2 ? 'rtl' : 'ltr' }}"> <!-- added new -->
                    <form action="{{ route('offer.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="mb-3">
                            <label class="form-label">Language</label>
                            <select id="languageSelect" name="language_id" class="form-control" onchange="changeFormDirection(this)"> <!-- added new -->
                                @foreach ($languages as $language)
                                    <option value="{{ $language->id }}" @if (isset($offer) && $offer->language_id == $language->id) selected @endif>
                                        {{ $language->name }}
                                    </option>
                                @endforeach
                            </select>
                            @error('language_id')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Offer Name --}}
                        <div class="mb-3">
                            <label class="form-label fw-bold">Offer Name</label>
                            <input type="text" name="name" class="form-control" placeholder="Enter offer name"
                                required>
                        </div>

                        {{-- Start & End Date --}}
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Start Date</label>
                                <input type="date" name="start_date" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">End Date</label>
                                <input type="date" name="end_date" class="form-control" required>
                            </div>
                        </div>


                        {{-- Select Products --}}
                        <div class="mb-3">
                            <label class="form-label fw-bold">Select Products</label>
                            <select id="productSelect" name="products[]" class="form-select select2" multiple required>
                                @foreach ($products as $product)
                                    <option value="{{ $product->id }}" data-price="{{ (float) $product->regular_price }}">
                                        {{ $product->product_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        {{-- Preview Selected Products --}}
                        <div class="mb-3">
                            <label class="form-label fw-bold">Selected Products</label>
                            <div class="table-responsive">
                                <table class="table table-bordered  " id="previewTable">
                                    <thead class="table-light ">
                                        <tr class="rounded-3">
                                            <th>Product</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>

                        {{-- Discount Section --}}
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Discount Type</label>
                                <select name="discount_type" id="discountType" class="form-select">
                                    <option value="percent">Percent (%)</option>
                                    <option value="fixed">Fixed</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Discount Value</label>
                                <input type="number" name="discount_value" id="discountValue" class="form-control"
                                    value="0" min="0">
                            </div>
                        </div>


                        {{-- Image Upload --}}
                        <div class="mb-3">
                            <label class="form-label fw-bold">Offer Image :(300x300), maximum size- 2MB</label>
                            <input type="file" name="image" class="form-control" accept="image/*" id="offerImage">
                            <div class="mt-2">
                                <img id="imagePreview" src="" alt="Image Preview"
                                    class="img-fluid rounded shadow-sm" style="max-height: 150px; display: none;">
                            </div>
                        </div>
                        <div class="card shadow-sm border-0 rounded-3 p-4 mb-4">

                            <div class="mb-3">
                                <label class="form-label fw-bold">Description</label>
                                <textarea name="description" class="form-control" rows="4" placeholder="Enter offer description"></textarea>
                            </div>
                            <!-- Price Summary -->
                            <div class="border-top pt-3">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <h6 class="mb-0 text-muted">Total Price:</h6>
                                    <span class="fw-bold" id="totalCost">$0.00</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-0">
                                    <h6 class="mb-0 text-muted">Discount Price:</h6>
                                    <span class="fw-bold text-success" id="finalPrice">$0.00</span>
                                </div>

                                <!-- Hidden Inputs -->
                                <input type="hidden" name="total_cost" id="totalCostInput" value="0">
                                <input type="hidden" name="final_price" id="finalPriceInput" value="0">
                            </div>

                            <!-- Newsletter Checkbox -->
                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox" id="sendToNewsletter"
                                    name="send_to_newsletter" value="1"
                                    {{ old('send_to_newsletter') ? 'checked' : '' }}>
                                <label class="form-check-label fw-semibold" for="sendToNewsletter">
                                    Send notification email to all newsletter subscribers
                                </label>
                            </div>
                        </div>


                        <button type="submit" class="btn btn-success w-100">Save Offer Package</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function() {
            // DataTable
            $('#offerTable').DataTable({
                processing: true,
                serverSide: true,
                searching: true,

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
                ordering: false,
                paging: true,
                lengthChange: true,
                info: true,
                ajax: "{{ route('offer.index') }}",
                columns: [{
                        data: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'offer_name',
                        name: 'offer_name'
                    },
                    // {
                    //     data: 'offer_percent',
                    //     name: 'offer_percent'
                    // },
                    // {
                    //     data: 'product_name',
                    //     name: 'product_name'
                    // },
                    {
                        data: 'offer_start_date',
                        name: 'offer_start_date'
                    },
                    {
                        data: 'offer_end_date',
                        name: 'offer_end_date'
                    },
                    {
                        data: 'image',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'language',
                        name: 'language'
                    },
                    {
                        data: 'action',
                        orderable: false,
                        searchable: false
                    },
                ],

            });

            // Select2
            $('.select2').select2({
                placeholder: "Select products",
                allowClear: true
            });

            // Product Preview & Calculation
            let selectedProducts = {};
            $("#productSelect").on("change", function() {
                let tbody = $("#previewTable tbody");
                tbody.empty();
                selectedProducts = {};

                $(this).find("option:selected").each(function() {
                    let id = $(this).val();
                    let name = $(this).text();
                    let price = parseFloat($(this).data("price")) || 0;

                    selectedProducts[id] = {
                        id,
                        name,
                        price
                    };

                    tbody.append(`
                <tr data-id="${id}">
                    <td>${name}</td>
                    <td>$${price.toFixed(2)}</td>
                </tr>
            `);
                });

                calculateTotal();
            });

            $("#discountValue, #discountType").on("input change", calculateTotal);

            function calculateTotal() {
                let total = 0;
                Object.values(selectedProducts).forEach(p => total += p.price);

                let discountType = $("#discountType").val();
                let discountValue = parseFloat($("#discountValue").val());
                let finalPrice = total;

                if (discountType === "percent") finalPrice = total - (total * discountValue / 100);
                if (discountType === "fixed") finalPrice = total - discountValue;

                $("#totalCost").text(total.toFixed(2));
                $("#finalPrice").text(finalPrice.toFixed(2));

                // Update hidden inputs for form submission
                $("#totalCostInput").val(total.toFixed(2));
                $("#finalPriceInput").val(finalPrice.toFixed(2));
            }



            // Image Preview
            $("#offerImage").on("change", function() {
                const [file] = this.files;
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        $("#imagePreview").attr("src", e.target.result).show();
                    }
                    reader.readAsDataURL(file);
                } else {
                    $("#imagePreview").hide();
                }
            });

        });
    </script>
     <script>
        $(document).ready(function() {
            // Function to load products based on selected language
            function loadProductsByLanguage(language_id) {
                $.ajax({
                    url: "{{ route('offer.loadproducts') }}", // This is the route to get products based on language_id
                    type: 'GET',
                    data: {
                        language_id: language_id
                    },
                    success: function(data) {
                        // console.log(data);
                        // Clear existing options
                        $('#productSelect').empty();
                        // Loop through the products and append them to the select element
                        data.products.forEach(function(product) {
                            $('#productSelect').append('<option value="' + product.id + '" data-price="' + product.regular_price + '">' + product.product_name + '</option>');
                        });
                        // Reinitialize select2 for the product select box
                        $('#productSelect').trigger('change'); // For reinitializing Select2
                    }
                });
            }

            // Load products based on the selected language on page load
            let selectedLanguage = $('#languageSelect').val();
            loadProductsByLanguage(selectedLanguage);

            // Listen for language change event and reload products
            $('#languageSelect').on('change', function() {
                let language_id = $(this).val();
                loadProductsByLanguage(language_id);
            });
        });
    </script>
@endpush
