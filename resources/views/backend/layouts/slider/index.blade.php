@extends('backend.master')

@section('title', 'Banner')

@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <!-- Page header -->
            <div class="mb-5">
                <h3 class="mb-0 "> Slider</h3>

            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-lg-8 col-12">
            <div class="card mb-4">
                <div class="card">
                    <div class="card-header d-md-flex border-bottom-0">
                        <div class="flex-grow-1">
                            <label class="form-label fw-bold">Slider List</label>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive table-card">
                            <table id="sliderTable"
                                class="table table-striped table-hover align-middle text-nowrap table-centered mt-0"
                                style="width:100%;">
                                <thead class="table-light">
                                    <tr>
                                        <th>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="checkAll">
                                            </div>
                                        </th>
                                        <th>#</th>
                                        <th>Image</th>
                                        <th>Title</th>
                                        <th>Page Location</th>
                                        <th>Language</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    @forelse($sliders as $key => $slider)
                                        <tr>
                                            <!-- Checkbox -->
                                            <td>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox"
                                                        value="{{ $slider->id }}">
                                                </div>
                                            </td>

                                            <!-- Index -->
                                            <td>{{ $key + 1 }}</td>

                                            <!-- Image -->
                                            <td>

                                                @if ($slider->images)
                                                    @foreach ($slider->images as $image)
                                                        <img src="{{ asset($image->image_path) }}" alt="slider"
                                                            width="80" height="50" class="rounded">
                                                    @endforeach
                                                @else
                                                    <span class="text-muted">No Image</span>
                                                @endif
                                            </td>

                                            <!-- Title -->
                                            <td>{{ $slider->title }}</td>

                                            <!-- Page Location -->
                                            <td><span class="badge bg-info">{{ ucfirst($slider->page_name) }}</span></td>

                                            <td>
                                                <!-- Display the Language -->
                                                <span class="badge bg-primary">{{ $slider->language ? $slider->language->name : 'No Language' }}</span>
                                            </td>

                                            <!-- Status -->
                                            <td>
                                                @if ($slider->status == 1)
                                                    <span class="badge bg-success">Active</span>
                                                @else
                                                    <span class="badge bg-danger">Inactive</span>
                                                @endif
                                            </td>

                                            <!-- Actions -->
                                            <td>
                                                <a href="{{ route('slider.edit', $slider->id) }}"
                                                    class="btn btn-sm btn-primary">
                                                    <i class="bi bi-pencil-square"></i>
                                                </a>
                                                <form action="{{ route('slider.destroy', $slider->id) }}"
                                                    method="POST"data-url={{ route('slider.destroy', $slider->id) }}
                                                    class="btn-delete d-inline">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-sm btn-danger">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="8" class="text-center text-muted">No slider found</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {{-- {{ $updateSlider }} --}}
        @can('banner create')
            <div class="col-lg-4 col-12">
                <form action="{{ isset($updateSlider) ? route('slider.update', $updateSlider->id) : route('slider.store') }}"
                    method="POST" enctype="multipart/form-data">

                    @csrf
                    @if (isset($updateSlider))
                        @method('PUT')
                    @endif

                    <div class="card mb-4">
                        <div class="card-body form-direction" dir="{{ session('language_id') == 2 ? 'rtl' : 'ltr' }}"> <!-- added new -->
                            <!-- Language Selection -->
                            <div class="mb-3">
                                <label class="form-label">Language</label>
                                <select name="language_id" class="form-control" onchange="changeFormDirection(this)">
                                    {{-- <option value="">--Select Language--</option> --}}
                                    @foreach ($languages as $language)
                                        <option value="{{ $language->id }}" {{ old('language_id', $updateSlider->language_id ?? '') == $language->id ? 'selected' : '' }}>
                                            {{ $language->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('language_id')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <!-- Title -->
                            <div class="mb-3">
                                <label class="form-label">Slider Title</label>
                                <input type="text" name="title" value="{{ old('title', $updateSlider->title ?? '') }}"
                                    class="form-control" placeholder="Enter Slider Title">
                                @error('title')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                            <!-- Description -->
                            <div class="mb-3">
                                <label class="form-label">Slider Subtitle</label>
                                <input type="text" name="description"
                                    value="{{ old('description', $updateSlider->description ?? '') }}" class="form-control"
                                    placeholder="Enter Slider Subtitle">
                                @error('description')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                            {{-- <!-- Button Text -->
                            <div class="mb-3">
                                <label class="form-label">Button Text (Optional)</label>
                                <input type="text" name="button_text"
                                    value="{{ old('button_text', $updateSlider->button_text ?? '') }}" class="form-control"
                                    placeholder="Enter Button Text">
                                @error('button_text')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div> --}}

                            <!-- Button URL -->
                            {{-- <div class="mb-3">
                                <label class="form-label">Button URL (Optional)</label>
                                <input type="text" name="button_link"
                                    value="{{ old('button_link', $updateSlider->button_link ?? '') }}" class="form-control"
                                    placeholder="Enter Button URL">
                                @error('button_link')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div> --}}

                            <!-- Page Name -->
                            <div class="mb-3">
                                <label class="form-label">Page Location</label>
                                <select name="page_name" class="form-control">
                                    <option value="">--Select Page--</option>
                                    @foreach (['products', 'about', 'offers', 'videos', 'blog', 'contact', 'product details', 'shoppping carts', 'checkout', 'wish list', 'profile onfo', 'order  history', 'change password'] as $page)
                                        <option value="{{ $page }}"
                                            {{ old('page_name', $updateSlider->page_name ?? '') == $page ? 'selected' : '' }}>
                                            {{ ucfirst($page) }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('page_name')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                            <!-- Images -->
                            <div class="mb-4">
                                <label class="form-label">Slider Images</label>
                                <input type="file" name="images[]" class="form-control" id="sliderImagesInput" multiple>
                                @error('images')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                                @error('images.*')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror

                                <!-- Old Images Preview -->
                                <div class="mt-2 d-flex flex-wrap gap-2" id="sliderImagesPreview">
                                    @if (isset($updateSlider) && $updateSlider->images)
                                        @foreach ($updateSlider->images as $img)
                                            <img src="{{ asset($img->image_path) }}" width="120" class="rounded border">
                                        @endforeach
                                    @endif
                                </div>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <select name="status" class="form-control">
                                    <option value="1"
                                        {{ old('status', $updateSlider->status ?? 1) == 1 ? 'selected' : '' }}>
                                        Active</option>
                                    <option value="0"
                                        {{ old('status', $updateSlider->status ?? 0) == 0 ? 'selected' : '' }}>
                                        Inactive</option>
                                </select>
                            </div>

                            <!-- Submit -->
                            <div class="d-grid">
                                <button class="btn btn-success mb-4">
                                    {{ isset($updateSlider) ? 'Update' : 'Create' }}
                                </button>
                                @if (isset($updateSlider))
                                    <a href="{{ route('slider.index') }}" class="btn btn-secondary">Back</a>
                                @endif
                            </div>
                        </div>
                    </div>
                </form>


            </div>
        @endcan


        {{-- category form  --}}
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function() {
            $('#bannerTable').DataTable({
                processing: true,
                searching: true,
                serverSide: true,

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

                ajax: {
                    url: "{{ route('banner.index') }}",
                    type: "GET"
                },
                serverSide: true,
                columns: [{
                        data: 'checkbox',
                        name: 'checkbox'
                    },
                    {
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false

                    },
                    {
                        data: 'banner_image',
                        name: 'banner_image'
                    },
                    {
                        data: 'banner_title',
                        name: 'banner_title'
                    },
                    {
                        data: 'banner_location',
                        name: 'banner_location'
                    },
                    {
                        data: 'button_text',
                        name: 'button_text'
                    },

                    {
                        data: 'status',
                        name: 'status'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false


                    }
                ]
            });
        });
    </script>

    <script>
        document.getElementById('sliderImagesInput').addEventListener('change', function(event) {
            let previewContainer = document.getElementById('sliderImagesPreview');
            previewContainer.innerHTML = ""; // clear old preview

            Array.from(event.target.files).forEach(file => {
                let reader = new FileReader();
                reader.onload = function(e) {
                    let img = document.createElement("img");
                    img.src = e.target.result;
                    img.width = 120;
                    img.classList.add("rounded", "border", "me-2", "mb-2");
                    previewContainer.appendChild(img);
                }
                reader.readAsDataURL(file);
            });
        });
    </script>
@endpush
