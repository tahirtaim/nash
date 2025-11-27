@extends('backend.master')

@section('title', 'Edit Offer')

@section('content')
    <div class="row">
        <div class="col-12 mb-4">
            <h3 class="mb-0 text-secondary">Edit Offer</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-6 col-12">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-header  text-white rounded-top-4">
                    <h5 class="mb-0">Update Offer</h5>
                </div>
                <div class="card-body form-direction" dir="{{ session('language_id') == 2 ? 'rtl' : 'ltr' }}"> <!-- added new -->
                    <form action="{{ route('offer.update', $offer->id) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')

                        {{--  Language --}}
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

                        {{-- Offer Title --}}
                        <div class="mb-3">
                            <label class="form-label fw-bold">Offer Title</label>
                            <input type="text" name="name" class="form-control" placeholder="Enter offer title"
                                value="{{ old('title', $offer->offer_name) }}" required>
                        </div>

                        {{-- Offer Period --}}
                        <div class="row mb-3">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label class="form-label fw-bold">Start Date</label>
                                <input type="date" name="offer_start_date" class="form-control"
                                    value="{{ old('offer_start_date', $offer->offer_start_date->format('Y-m-d')) }}"
                                    required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">End Date</label>
                                <input type="date" name="offer_end_date" class="form-control"
                                    value="{{ old('offer_end_date', $offer->offer_end_date->format('Y-m-d')) }}" required>
                            </div>
                        </div>

                        {{-- Product Selection --}}
                        <div class="mb-3">
                            <label class="form-label fw-bold">Choose Products</label>
                            <select id="productSelect" name="products[]" class="form-select select2" multiple required>
                                @foreach ($products as $product)
                                    <option value="{{ $product->id }}" data-price="{{ (float) $product->regular_price }}"
                                        {{ in_array($product->id, $offer->products->pluck('id')->toArray()) ? 'selected' : '' }}>
                                        {{ $product->product_name }} -
                                        ${{ number_format((float) $product->regular_price, 2) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        {{-- Selected Product Preview --}}
                        <div class="mb-3">
                            <label class="form-label fw-bold">Selected Products Preview</label>
                            <div class="table-responsive border rounded-3">
                                <table class="table table-bordered mb-0" id="previewTable">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Product</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($offer->products as $product)
                                            <tr data-id="{{ $product->id }}">
                                                <td>{{ $product->product_name }}</td>
                                                <td>${{ number_format((float) $product->regular_price, 2) }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        {{-- Discount Options --}}
                        <div class="row mb-3">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label class="form-label fw-bold">Discount Type</label>
                                <select name="discount_type" id="discountType" class="form-select">
                                    <option value="percent" {{ $offer->discount_type == 'percent' ? 'selected' : '' }}>
                                        Percentage (%)</option>
                                    <option value="fixed" {{ $offer->discount_type == 'fixed' ? 'selected' : '' }}>Fixed
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Discount Amount</label>
                                <input type="number" name="discount_value" id="discountValue" class="form-control"
                                    value="{{ old('discount_value', $offer->discount_value) }}" min="0">
                            </div>
                        </div>

                        {{-- Offer Image --}}
                        <div class="mb-4">
                            <label class="form-label fw-bold">Offer Image</label>
                            <input type="file" name="image" class="form-control" accept="image/*" id="offerImage">
                            <div class="mt-2">
                                <img id="imagePreview" src="{{ $offer->image ? asset($offer->image) : '' }}"
                                    alt="Image Preview" class="img-fluid rounded shadow-sm"
                                    style="max-height: 150px; {{ $offer->image ? '' : 'display:none;' }}">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Description</label>
                            <textarea name="description" class="form-control" rows="4" placeholder="Enter offer description"></textarea>
                        </div>

                        {{-- Price Summary --}}
                        <div class="card p-3 mb-4 border rounded-3 shadow-sm">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="mb-0 text-muted">Total Price:</h6>
                                <span class="fw-bold"
                                    id="totalCost">${{ number_format((float) $offer->total_cost, 2) }}</span>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <h6 class="mb-0 text-muted">Price After Discount:</h6>
                                <span class="fw-bold text-success"
                                    id="finalPrice">${{ number_format((float) $offer->final_price, 2) }}</span>
                            </div>

                            <input type="hidden" name="total_cost" id="totalCostInput" value="{{ $offer->total_cost }}">
                            <input type="hidden" name="final_price" id="finalPriceInput"
                                value="{{ $offer->final_price }}">
                        </div>

                        <button type="submit" class="btn btn-success w-100 py-2 fw-semibold">Update Offer</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function() {
            $('.select2').select2({
                placeholder: "Select products",
                allowClear: true
            });

            // Populate selectedProducts for calculation
            let selectedProducts = {};
            $("#productSelect option:selected").each(function() {
                let id = $(this).val();
                let name = $(this).text();
                let price = parseFloat($(this).data("price")) || 0;
                selectedProducts[id] = {
                    id,
                    name,
                    price
                };
            });

            // Recalculate total on load
            calculateTotal();

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

                    tbody.append(
                        `<tr data-id="${id}"><td>${name}</td><td>$${price.toFixed(2)}</td></tr>`
                    );
                });

                calculateTotal();
            });

            $("#discountValue, #discountType").on("input change", calculateTotal);

            function calculateTotal() {
                let total = 0;
                Object.values(selectedProducts).forEach(p => total += p.price);
                let discountType = $("#discountType").val();
                let discountValue = parseFloat($("#discountValue").val()) || 0;
                let finalPrice = total;

                if (discountType === "percent") finalPrice = total - (total * discountValue / 100);
                if (discountType === "fixed") finalPrice = total - discountValue;

                $("#totalCost").text(total.toFixed(2));
                $("#finalPrice").text(finalPrice.toFixed(2));
                $("#totalCostInput").val(total.toFixed(2));
                $("#finalPriceInput").val(finalPrice.toFixed(2));
            }

            // Image preview
            $("#offerImage").on("change", function() {
                const [file] = this.files;
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        $("#imagePreview").attr("src", e.target.result).show();
                    }
                    reader.readAsDataURL(file);
                }
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            // Initialize select2 for product selection
            $('.select2').select2({
                placeholder: "Select products",
                allowClear: true
            });

            // Function to load products based on selected language
            function loadProductsByLanguage(language_id) {
                $.ajax({
                    url: "{{ route('offer.loadproducts') }}", // Adjust this route if needed
                    type: 'GET',
                    data: {
                        language_id: language_id
                    },
                    success: function(data) {
                        // Clear existing options
                        $('#productSelect').empty();

                        // Loop through the products and append them to the select element
                        data.products.forEach(function(product) {
                            $('#productSelect').append('<option value="' + product.id + '" data-price="' + product.regular_price + '">' + product.product_name + '</option>');
                        });

                        // Reinitialize select2 for the product select box
                        $('#productSelect').trigger('change'); // For reinitializing Select2

                        // Re-add previously selected products to the select element
                        @foreach ($offer->products as $product)
                            $('#productSelect option[value="{{ $product->id }}"]').prop('selected', true);
                        @endforeach

                        // Trigger change event to refresh the UI
                        $('#productSelect').trigger('change');
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

            // Product selection change handler
            $("#productSelect").on("change", function() {
                let tbody = $("#previewTable tbody");
                tbody.empty();

                let selectedProducts = {};
                $(this).find("option:selected").each(function() {
                    let id = $(this).val();
                    let name = $(this).text();
                    let price = parseFloat($(this).data("price")) || 0;
                    selectedProducts[id] = {
                        id,
                        name,
                        price
                    };

                    tbody.append(`<tr data-id="${id}"><td>${name}</td><td>$${price.toFixed(2)}</td></tr>`);
                });

                calculateTotal(selectedProducts);
            });

            // Discount change handler
            $("#discountValue, #discountType").on("input change", function() {
                let selectedProducts = {};
                $("#productSelect option:selected").each(function() {
                    let id = $(this).val();
                    let name = $(this).text();
                    let price = parseFloat($(this).data("price")) || 0;
                    selectedProducts[id] = {
                        id,
                        name,
                        price
                    };
                });
                calculateTotal(selectedProducts);
            });

            // Calculate Total
            function calculateTotal(selectedProducts) {
                let total = 0;
                Object.values(selectedProducts).forEach(p => total += p.price);
                let discountType = $("#discountType").val();
                let discountValue = parseFloat($("#discountValue").val()) || 0;
                let finalPrice = total;

                if (discountType === "percent") finalPrice = total - (total * discountValue / 100);
                if (discountType === "fixed") finalPrice = total - discountValue;

                $("#totalCost").text(total.toFixed(2));
                $("#finalPrice").text(finalPrice.toFixed(2));
                $("#totalCostInput").val(total.toFixed(2));
                $("#finalPriceInput").val(finalPrice.toFixed(2));
            }

            // Image preview for uploaded image
            $("#offerImage").on("change", function() {
                const [file] = this.files;
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        $("#imagePreview").attr("src", e.target.result).show();
                    }
                    reader.readAsDataURL(file);
                }
            });
        });
    </script>
@endpush
