@extends('backend.master')

@push('styles')
    <style>
        .mini-preview-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 4px;
        }

        /* CSS */
        .brand-display {
            font-family: 'Playfair Display', serif;
            font-size: 1.25rem;
            font-weight: 600;
            color: #0F2740;
            /* deep navy */
            background: #F6F5F3;
            display: inline-block;
            box-shadow: 0 2px 6px rgba(15, 39, 64, 0.06);
            margin-top: 4px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" rel="stylesheet">
@endpush

@section('title', isset($product) ? 'Update Product' : 'Create Product')

@section('content')
    <form action="{{ isset($product) ? route('product.update', $product->id) : route('product.store') }}"
        enctype="multipart/form-data" method="post">
        <div class="card shadow-sm mb-2">
            <div class="card-header  text-white text-center">
                <h5 class="mb-0">
                    @if (isset($product))
                        <i class="bi bi-pencil-square me-2"></i> Edit Product
                    @else
                        <i class="bi bi-plus-circle me-2"></i> Add Product
                    @endif
                </h5>
            </div>
        </div>
        @csrf
        @if (isset($product))
            @method('PUT')
        @endif

        <div class="row">
            <!-- Left Column -->
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-header">Product Information</div>
                    <div class="card-body form-direction" dir="{{ session('language_id') == 2 ? 'rtl' : 'ltr' }}"> <!-- added new -->
                        <!-- Product Title -->
                        {{-- <div class="mb-3">
                            <label class="form-label">Product Title <span class="text-danger">*</span></label>
                            <input type="text" name="product_name" class="form-control" 
                                value="{{ old('product_name', $product->product_name ?? '') }}">
                            @error('product_name')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div> --}}
                        <!-- Product Title -->
                        <div class="mb-3">
                            <label class="form-label">Product Title <span class="text-danger">*</span></label>
                            <input type="text" name="product_name" class="form-control" 
                                value="{{ old('product_name', $product->product_name ?? '') }}">
                            @error('product_name')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>


                        <!-- Short Description -->
                        <div class="mb-3">
                            <label class="form-label">Short Description</label>
                            <textarea class="form-control" name="short_description" rows="2">{{ old('short_description', $product->short_description ?? '') }}</textarea>
                            @error('short_description')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control summernote" name="description">{{ old('description', $product->description ?? '') }}</textarea>
                        </div>

                        <!-- Additional Description -->
                        <div class="mb-3">
                            <label class="form-label">Additional Description</label>
                            <textarea class="form-control summernote" name="additional_description">{{ old('additional_description', $product->additional_description ?? '') }}</textarea>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header">Product Images</div>
                     <div class="card-body form-direction" dir="{{ session('language_id') == 2 ? 'rtl' : 'ltr' }}"> <!-- added new -->
                        <!-- Featured Image -->
                        <div class="mb-3">
                            <label class="form-label">Featured Image</label>
                            <input type="file" name="featured_image" class="form-control" accept="image/*"
                                onchange="previewFeaturedImage(this)">
                            @error('featured_image')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                            <div class="mt-2">
                                <img id="featuredImagePreview"
                                    src="{{ isset($product->featured_image) ? asset($product->featured_image) : '' }}"
                                    alt="Featured Image Preview"
                                    class="img-thumbnail {{ isset($product->featured_image) ? '' : 'd-none' }}"
                                    width="200">
                            </div>
                        </div>

                        <!-- Product Image (Separate if needed) -->
                        @isset($product->product_image)
                            <div class="mb-3">
                                <label class="form-label">Product Main Image</label>
                                <div class="mt-2">
                                    <img id="productImagePreview"
                                        src="{{ isset($product->product_image) ? asset($product->product_image) : '' }}"
                                        alt="Product Image" class="img-thumbnail" width="100">
                                </div>
                            </div>
                        @endisset

                        <!-- Gallery Upload -->
                        <div class="mb-3">
                            <label class="form-label">Gallery Images</label>
                            <input type="file" name="gallery_images[]" class="form-control" accept="image/*" multiple
                                onchange="previewGalleryImages(this)">
                            <div class="row mt-3" id="galleryPreview"></div>
                        </div>

                        <!-- Existing Gallery -->
                        <div class="mb-3">
                            @isset($product->galleries)
                                <label class="form-label">Existing Gallery Images</label>
                            @endisset

                            <div class="row">
                                @foreach (isset($product->galleries) ? $product->galleries : [] as $gallery)
                                    <div class="col-md-3 mb-2">
                                        <img src="{{ asset($gallery->image_path) }}" alt="Gallery Image"
                                            class="img-thumbnail" width="80">
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <!-- Submit -->
                    <div class="col-12 d-flex justify-content-between gap-2 mx-auto p-4">
                        <a href="{{ route('product.index') }}" class="btn btn-secondary w-50">Back</a>
                        <button type="submit" class="btn btn-primary w-50">
                            {{ isset($product) ? 'Update Product' : 'Create Product' }}
                        </button>
                    </div>
                </div>

            </div>

            <!-- Right Column -->
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-header">Product Meta</div>
                    {{-- <div class="card-body"> --}}
                    <div class="card-body form-direction" dir="{{ session('language_id') == 2 ? 'rtl' : 'ltr' }}"> <!-- added new -->
                        <!-- HTML -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Brand : </label>
                            <!-- hidden input that stores the fixed value -->
                            <input type="hidden" name="brand" value="Allurdevine">

                            <!-- visible styled text instead of input -->
                            <h5 class="brand-display">Allurdevine</h5>
                        </div>
                        <!-- Language --> <!-- added new -->
                            <div class="mb-3">
                                <label class="form-label">Language</label>
                                <select name="language_id" class="form-control" onchange="changeFormDirection(this)"> <!-- added new -->
                                    @foreach ($languages as $language)
                                        <option value="{{ $language->id }}" @if (isset($product) && $product->language_id == $language->id) selected @endif>
                                            {{ $language->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('language_id')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Category</label>
                            <input type="hidden" id="selectedCategoryId"
                            value="{{ old('category_id', $product->category_id ?? '') }}">
                            <select name="category_id" class="form-select form-control">
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}"
                                        {{ old('category_id', $product->category_id ?? '') == $category->id ? 'selected' : '' }}>
                                        {{ $category->name }}
                                    </option>
                                @endforeach
                            </select>
                            @error('category_id')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Product Type</label>
                            <div class="d-flex flex-wrap gap-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="product_type" value="featured"
                                        id="productFeatured"
                                        {{ in_array('featured', (array) old('product_type', isset($product) ? [$product->product_type] : [])) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="productFeatured">Featured</label>
                                </div>
                                {{-- <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="product_type[]" value="new"
                                        id="productNew"
                                        {{ in_array('new', old('product_type', isset($product) ? [$product->product_type] : [])) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="productNew">New</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="product_type[]"
                                        value="popular" id="productPopular"
                                        {{ in_array('popular', old('product_type', isset($product) ? [$product->product_type] : [])) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="productPopular">Popular</label>
                                </div> --}}
                            </div>
                        </div>

                        {{-- <div class="mb-3">
                            <label class="form-label">Version Type</label>
                            <select name="product_version_type" class="form-select" >
                                <option value="arabic"
                                    {{ old('product_version_type', $product->product_version_type ?? '') == 'arabic' ? 'selected' : '' }}>
                                    Arabic</option>
                                <option value="english"
                                    {{ old('product_version_type', $product->product_version_type ?? '') == 'english' ? 'selected' : '' }}>
                                    English</option>
                            </select>
                        </div> --}}



                        <!-- Status -->
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select name="status" class="form-select">
                                <option value="1"
                                    {{ old('status', $product->status ?? '1') == '1' ? 'selected' : '' }}>Published
                                </option>
                                <option value="0"
                                    {{ old('status', $product->status ?? '') == '0' ? 'selected' : '' }}>Unpublished
                                </option>
                                <option value="2"
                                    {{ old('status', $product->status ?? '') == '2' ? 'selected' : '' }}>Draft</option>
                            </select>
                        </div>

                        <!-- Price & Stock -->
                        <div class="mb-3">
                            <label class="form-label">Regular Price</label>
                            <input type="text" name="regular_price" class="form-control"
                                value="{{ old('regular_price', $product->regular_price ?? '') }}">
                            @error('regular_price')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Discount Price</label>
                            <input type="text" name="discount_price" class="form-control"
                                value="{{ old('discount_price', $product->discount_price ?? '') }}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Quantity</label>
                            <input type="number" name="quantity" class="form-control" min="0"
                                value="{{ old('quantity', $inventory->quantity ?? '') }}">
                            @error('quantity')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>


                    </div>
                </div>
            </div>


        </div>
    </form>
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>

    <script>
        $(document).ready(function() {
            $('.summernote').summernote({
                placeholder: 'Write here...',
                tabsize: 2,
                height: 200,
                toolbar: [
                    ['style', ['bold', 'italic', 'underline', 'clear']],
                    ['fontstyle', ['strikethrough', 'superscript', 'subscript']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['insert', ['link', 'table', 'hr']], // No 'picture'
                    ['view', ['fullscreen', 'codeview', 'help']]
                ]
            });
        });

        function toggleWeightFields(show) {
            document.getElementById('weightFields').style.display = show ? 'block' : 'none';
        }

        function previewFeaturedImage(input) {
            const preview = document.getElementById('featuredImagePreview');
            const file = input.files?.[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = e => {
                    preview.src = e.target.result;
                    preview.classList.remove('d-none');
                };
                reader.readAsDataURL(file);
            } else {
                preview.classList.add('d-none');
            }
        }

        function previewGalleryImages(input) {
            const previewContainer = document.getElementById('galleryPreview');
            previewContainer.innerHTML = '';
            Array.from(input.files).forEach(file => {
                const reader = new FileReader();
                reader.onload = e => {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.className = 'img-thumbnail mini-preview-img';
                    const col = document.createElement('div');
                    col.className = 'col-auto mb-2';
                    col.appendChild(img);
                    previewContainer.appendChild(col);
                };
                reader.readAsDataURL(file);
            });
        }
    </script>
    <script>
        function changeFormDirection(select) {
            const lang = select.value;

            // Update form direction visually
            document.querySelector(".form-direction").setAttribute("dir", lang == 2 ? "rtl" : "ltr");

            const selectedCategory = document.getElementById("selectedCategoryId").value;
            const categoryDropdown = document.querySelector("select[name='category_id']");

            // Load categories from backend
            fetch(`/get-categories-by-language/${lang}`)
                .then(response => response.json())
                .then(data => {
                    categoryDropdown.innerHTML = '';

                    // No categories found
                    if (data.length === 0) {
                        categoryDropdown.innerHTML = '<option value="">No categories found</option>';
                        return;
                    }

                    // Insert categories
                    data.forEach(category => {
                        const option = document.createElement("option");
                        option.value = category.id;
                        option.textContent = category.name;

                        // Auto-select previous category during edit
                        if (parseInt(selectedCategory) === category.id) {
                            option.selected = true;
                        }

                        categoryDropdown.appendChild(option);
                    });
                });
        }
        
    </script>
@endpush
