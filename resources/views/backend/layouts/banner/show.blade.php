@extends('backend.master')

@section('title', 'Banner')

@section('content')
    <div class="row justify-content-start py-4">
        <div class="col-md-7">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">

                {{-- Full-width Banner Image --}}
                @if (isset($banner) && $banner->banner_image)
                    <img src="{{ asset($banner->banner_image) }}" alt="Banner Image" class="w-100"
                        style="height: 250px; object-fit: cover padding: 10px;">
                @endif

                <div class="card-body">
                    @if (isset($banner))
                        {{-- Title --}}
                        <div class="mb-3">
                            <label class="form-label fw-medium text-muted">Title</label>
                            <div class="fs-6 text-dark">{{ $banner->banner_title ?? 'N/A' }}</div>
                        </div>

                        {{-- Subtitle --}}
                        <div class="mb-3">
                            <label class="form-label fw-medium text-muted">Subtitle</label>
                            <div class="fs-6 text-secondary">{!! $banner->banner_location ?? 'N/A' !!}</div>
                        </div>

                        {{-- Status --}}
                        <div class="mb-2">
                            <label class="form-label fw-medium text-muted">Status</label><br>
                            <span class="badge px-3 py-2 {{ $banner->status == 1 ? 'bg-success' : 'bg-secondary' }}">
                                {{ $banner->status == 1 ? 'Published' : 'Unpublished' }}
                            </span>
                        </div>
                    @else
                        <div class="alert alert-warning border-0 rounded-3">
                            Banner not found.
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
@endpush
