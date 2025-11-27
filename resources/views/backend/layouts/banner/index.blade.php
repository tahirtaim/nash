@extends('backend.master')

@section('title', 'Banner')

@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <!-- Page header -->
            <div class="mb-5">
                <h3 class="mb-0 "> Banner</h3>

            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-lg-7 col-12">
            <div class="card mb-4">
                <!-- card body -->
                <div class="card">
                    <div class="card-header d-md-flex border-bottom-0">
                        <div class="flex-grow-1">
                            <a href="" class="text-bolder"><label class="form-label">Banner
                                    List</label></a>
                        </div>
                        {{-- <div class="mt-3 mt-md-0">
                            <a href="#!" class="btn btn-outline-white ms-2">Excel</a>
                            <a href="#!" class="btn btn-outline-white ms-2">Import</a>
                            <a href="#!" class="btn btn-outline-white ms-2">Export</a>
                        </div> --}}
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table-card">
                            <div id="example_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">

                                {{-- table   --}}
                                <div class="row dt-row">
                                    <div class="col-sm-12">
                                        <table id="bannerTable"
                                            class="table table-striped table-hover align-middle text-nowrap table-centered mt-0 dataTable no-footer dtr-inline"
                                            style="width: 100%;" role="grid" aria-describedby="example_info">

                                            <thead class="table-light">
                                                <tr role="row">
                                                    <th>#</th>
                                                    <th class="sorting" tabindex="0" aria-controls="example"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Button Text: activate to sort column ascending">
                                                        Image
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="example"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Banner Title: activate to sort column ascending">
                                                        Banner Title
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="example"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Status: activate to sort column ascending">
                                                        Status
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="example"
                                                        rowspan="1" colspan="1"
                                                        aria-label="Action: activate to sort column ascending">
                                                        Action
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{-- banner form --}}

        @can('banner create')
            <div class="col-lg-5 col-12">
                <form action="{{ isset($banner) ? route('banner.update', $banner->id) : route('banner.store') }}"
                    enctype="multipart/form-data" method="post">
                    <div class="card shadow-sm mb-2">
                        <div class="card-header text-white text-center">
                            <h5 class="mb-0">
                                @if (isset($banner))
                                    <i class="bi bi-pencil-square me-2"></i> Edit Banner
                                @else
                                    <i class="bi bi-plus-circle me-2"></i> Add Banner
                                @endif
                            </h5>
                        </div>
                    </div>

                    @if (isset($banner))
                        @method('PUT')
                    @endif
                    @csrf

                    <div class="card mb-4">
                        <!-- card body -->
                        <div class="card-body form-direction" dir="{{ session('language_id') == 2 ? 'rtl' : 'ltr' }}"> <!-- added new -->

                            <!-- Language --> <!-- added new -->
                            <div class="mb-3">
                                <label class="form-label">Language</label>
                                <select name="language_id" class="form-control" onchange="changeFormDirection(this)"> <!-- added new -->
                                    @foreach ($languages as $language)
                    <!-- change $banner--> <option value="{{ $language->id }}" @if (isset($banner) && $banner->language_id == $language->id) selected @endif>
                                            {{ $language->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('language_id')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                            <!-- Banner Title -->
                            <div class="mb-3">
                                <label class="form-label"> Title</label>
                                <input type="text" name="banner_title" value="{{ $banner->banner_title ?? '' }}"
                                    class="form-control" placeholder="Enter Banner Title">
                                @error('banner_title')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                            <!-- Banner Sub Title -->
                            <div class="mb-3">
                                <label class="form-label"> Subtitle</label>
                                <input type="text" name="banner_subtitle" value="{{ $banner->banner_subtitle ?? '' }}"
                                    class="form-control" placeholder="Enter Banner Subtitle">
                                @error('banner_subtitle')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>



                            <!-- URL -->
                            <div class="mb-3">
                                <label class="form-label">URL</label>
                                <input type="text" name="url" value="{{ $banner->url ?? '' }}" class="form-control"
                                    placeholder="Enter Button URL">
                                @error('url')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>

                            <!-- Banner Images -->
                            <div class="mb-4">
                                <label class="form-label">Images</label>
                                <input type="file" name="banner_images[]" class="form-control" id="bannerImagesInput"
                                    multiple>
                                @error('banner_images')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror

                                <!-- Preview Multiple Images -->
                                <div class="mt-3 d-flex flex-wrap gap-2" id="bannerImagesPreview">
                                    @if (isset($banner) && $banner->images)
                                        @foreach ($banner->images  as $image)
                                            <img src="{{ asset($image->image_path) }}" alt="Banner Image" width="100"
                                                class="rounded border">
                                        @endforeach
                                    @endif
                                </div>
                            </div>



                            <!-- Buttons -->
                            <div class="d-grid">
                                @if (isset($banner))
                                    <button class="btn btn-success mb-4">Update</button>
                                    <a href="{{ route('banner.index') }}" class="btn btn-secondary">Back</a>
                                @else
                                    <button class="btn btn-success mb-4">Create</button>
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
                        data: 'language', // added new
                        name: 'language'
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
        document.getElementById('bannerImagesInput').addEventListener('change', function(event) {
            const previewContainer = document.getElementById('bannerImagesPreview');
            previewContainer.innerHTML = ''; // clear old previews
            const files = event.target.files;

            if (files.length > 0) {
                Array.from(files).forEach(file => {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        img.width = 100;
                        img.classList.add('rounded', 'border', 'me-2', 'mb-2');
                        previewContainer.appendChild(img);
                    };
                    reader.readAsDataURL(file);
                });
            }
        });
    </script>
@endpush
