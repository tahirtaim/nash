@extends('backend.master')

@section('title', 'Video')

@section('content')
    <div class="row">
        <div class="col-lg-12 col-md-12 col-12">
            <!-- Page header -->
            <div class="mb-5">
                <h3 class="mb-0 "> Video</h3>

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
                            <a href="" class="text-bolder"><label class="form-label">Video
                                    List</label></a>
                        </div>
                        <div class="mt-3 mt-md-0">
                            <a href="#!" class="btn btn-outline-white ms-2">Excel</a>
                            <a href="#!" class="btn btn-outline-white ms-2">Import</a>
                            <a href="#!" class="btn btn-outline-white ms-2">Export</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive table-card">
                            <div id="example_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">

                                {{-- table   --}}
                                <div class="row dt-row">
                                    <div class="col-sm-12">
                                        <table id="videoTable"
                                            class="table table-striped table-hover align-middle text-nowrap table-centered mt-0 dataTable no-footer dtr-inline"
                                            style="width: 100%;">
                                            <thead class="table-light">
                                                <tr>
                                                    <th style="width: 42px;">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" id="checkAll">
                                                            <label class="form-check-label" for="checkAll"></label>
                                                        </div>
                                                    </th>
                                                    <th>#</th>
                                                    <th>Title</th>
                                                    <th>Thumbnail</th>
                                                    <th>YouTube Link</th>
                                                    <th>Language</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{-- Video Form --}}
        <div class="col-lg-5 col-12">
            <form action="{{ isset($video) ? route('video.update', $video->id) : route('video.store') }}" method="POST"
                enctype="multipart/form-data">
                @if (isset($video))
                    @method('PUT')
                @endif
                @csrf

                <div class="card shadow-sm mb-2">
                    <div class="card-header text-white text-center">
                        <h5 class="mb-0">
                            @if (isset($video))
                                <i class="bi bi-pencil-square me-2"></i> Edit Video
                            @else
                                <i class="bi bi-plus-circle me-2"></i> Add Video
                            @endif
                        </h5>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body form-direction" dir="{{ session('language_id') == 2 ? 'rtl' : 'ltr' }}"> <!-- added new -->
                        <!-- Language --> <!-- added new -->
                            <div class="mb-3">
                                <label class="form-label">Language</label>
                                <select name="language_id" class="form-control" onchange="changeFormDirection(this)"> <!-- added new -->
                                    @foreach ($languages as $language)
                                        <option value="{{ $language->id }}" @if (isset($video) && $video->language_id == $language->id) selected @endif>
                                            {{ $language->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('language_id')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        {{-- Title --}}
                        <div class="mb-3">
                            <label class="form-label">Title</label>
                            <input type="text" name="title" value="{{ old('title', $video->title ?? '') }}"
                                class="form-control" placeholder="Enter Video Title">
                            @error('title')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- Thumbnail Upload with Preview --}}
                        <div class="mb-3">
                            <label class="form-label">Thumbnail</label>
                            <input type="file" name="thumbnail" class="form-control" onchange="previewThumbnail(event)">


                            {{-- Image Preview --}}
                            <div class="mt-3">
                                <img id="thumbnailPreview"
                                    src="{{ isset($video) && $video->thumbnail ? asset($video->thumbnail) : '' }}"
                                    alt="Thumbnail Preview"
                                    style="max-height: 200px; {{ isset($video) && $video->thumbnail ? '' : 'display:none;' }}">
                            </div>
                        </div>

                        {{-- Video Type --}}
                        <div class="mb-3">
                            <label class="form-label">Video Type</label>
                            <select name="video_type" class="form-control">
                                <option value="">-- Select Video Type --</option>
                                <option value="featured"
                                    {{ old('video_type', $video->video_type ?? '') == 'featured' ? 'selected' : '' }}>
                                    Featured
                                </option>
                                <option value="popular"
                                    {{ old('video_type', $video->video_type ?? '') == 'popular' ? 'selected' : '' }}>
                                    Popular
                                </option>
                            </select>
                            @error('video_type')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>

                        {{-- YouTube Link --}}
                        <div class="mb-3">
                            <label class="form-label">YouTube Link</label>
                            <input type="url" name="youtube_link"
                                value="{{ old('youtube_link', $video->youtube_link ?? '') }}" class="form-control"
                                placeholder="Enter YouTube Link">
                            @error('youtube_link')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>


                        {{-- Submit Button --}}
                        <div class="d-grid">
                            @if (isset($video))
                                <button class="btn btn-success mb-4">Update</button>
                                <a href="{{ route('video.index') }}" class="btn btn-secondary">Back</a>
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
    <script>
        $(document).ready(function() {
            $('#videoTable').DataTable({
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
                    url: "{{ route('video.index') }}",
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
                        data: 'thumbnail',
                        name: 'thumbnail'
                    },
                    {
                        data: 'youtube_link',
                        name: 'youtube_link'
                    },
                    {
                        data: 'language',
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

    {{-- JS for thumbnail preview --}}
    <script>
        function previewThumbnail(event) {
            const input = event.target;
            const reader = new FileReader();

            reader.onload = function() {
                const preview = document.getElementById('thumbnailPreview');
                preview.src = reader.result;
                preview.style.display = 'block';
            };

            if (input.files && input.files[0]) {
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
@endpush
