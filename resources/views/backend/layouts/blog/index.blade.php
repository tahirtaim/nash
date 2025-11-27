@extends('backend.master')
@push('styles')
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" rel="stylesheet">
@endpush
@section('title', 'Blog')

@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <!-- Page header -->
            <div class="mb-5">
                <h3 class="mb-0 "> Blog</h3>

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
                            <a href="" class="text-bolder"><label class="form-label">Blog
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
                                        <table id="blogTable"
                                            class="table table-striped table-hover align-middle text-nowrap table-centered mt-0 dataTable no-footer dtr-inline"
                                            style="width: 100%;" role="grid" aria-describedby="example_info">

                                            <thead class="table-light">
                                                <tr role="row">
                                                    <th class="pe-0 sorting_asc" tabindex="0" style="width: 42px;"
                                                        aria-sort="ascending">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="checkAll">
                                                            <label class="form-check-label" for="checkAll"></label>
                                                        </div>
                                                    </th>
                                                    <th>#</th>
                                                    <th class="sorting" tabindex="0"
                                                        aria-label="Blog Title: activate to sort column ascending">
                                                        Blog Title
                                                    </th>
                                                    <th class="sorting" tabindex="0"
                                                        aria-label="Description: activate to sort column ascending">
                                                        Description
                                                    </th>
                                                    <th class="sorting" tabindex="0"
                                                        aria-label="Image: activate to sort column ascending">
                                                        Image
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1"
                                                        aria-label="Language: activate to sort column ascending">
                                                         Language
                                                    </th>
                                                    <th class="sorting" tabindex="0"
                                                        aria-label="Status: activate to sort column ascending">
                                                        Status
                                                    </th>
                                                    <th class="sorting" tabindex="0"
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
        {{-- blog form --}}

        <div class="col-lg-5 col-12">
            <form action="{{ isset($blog) ? route('blog.update', $blog->id) : route('blog.store') }}"
                enctype="multipart/form-data" method="post">
                <div class="card shadow-sm mb-2">
                    <div class="card-header text-white text-center">
                        <h5 class="mb-0">
                            @if (isset($blog))
                                <i class="bi bi-pencil-square me-2"></i> Edit Blog
                            @else
                                <i class="bi bi-plus-circle me-2"></i> Add Blog
                            @endif
                        </h5>
                    </div>
                </div>

                @if (isset($blog))
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
                                        <option value="{{ $language->id }}" @if (isset($blog) && $blog->language_id == $language->id) selected @endif>
                                            {{ $language->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('language_id')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        <!-- Blog Title -->
                        <div class="mb-3">
                            <label class="form-label">Blog Title</label>
                            <input type="text" name="title" value="{{ old('title', $blog->title ?? '') }}"
                                class="form-control" placeholder="Enter Blog Title">
                            @error('title')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <!-- Blog Description -->
                        <div class="mb-3">
                            <div class="mb-3">
                                <label for="description" class="form-label">Blog Description</label>
                                <textarea class="form-control summernote" name="description" id="description" rows="5"> {{ isset($blog->description) ? $blog->description : '' }}</textarea>
                            </div>
                            @error('description')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        <!-- Blog Image -->
                        <div class="mb-4">
                            <label class="form-label">Blog Image</label>
                            <input type="file" name="image" class="form-control">
                            @error('image')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                            @if (isset($blog) && $blog->image)
                                <div class="mt-2">
                                    <img src="{{ asset($blog->image) }}" alt="Blog Image" width="100">
                                </div>
                            @endif
                        </div>


                        <div class="form-check mt-3 mb-3">
                            <input class="form-check-input" type="checkbox" name="blog_type" value="featured"
                                id="blogFeatured"
                                {{ in_array('featured', old('blog_type', isset($blog) ? [$blog->blog_type] : [])) ? 'checked' : '' }}>
                            <label class="form-check-label" for="blogFeatured">Featured</label>
                        </div>

                        <!-- Buttons -->
                        <div class="d-grid">
                            @if (isset($blog))
                                <button class="btn btn-success mb-4">Update</button>
                                <a href="{{ route('blog.index') }}" class="btn btn-secondary">Back</a>
                            @else
                                <button class="btn btn-success mb-4">Create</button>
                            @endif
                        </div>
                    </div>
                </div>
            </form>
        </div>
        {{-- blog form end --}}

    </div>
@endsection

@push('scripts')
    {{-- // summernote js  --}}
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#blogTable').DataTable({
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
                ajax: {
                    url: "{{ route('blog.index') }}",
                    type: "GET"
                },
                columns: [{
                        data: 'checkbox',
                        name: 'checkbox',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'title',
                        name: 'title'
                    },
                    {
                        data: 'description',
                        name: 'description'
                    },
                    {
                        data: 'image',
                        name: 'image'
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

    {{-- // summernote initial  --}}
    <script>
        $(document).ready(function() {
            $('.summernote').summernote({
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
    </script>
@endpush
