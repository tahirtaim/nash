@extends('backend.master')

@section('title', $video->title)

@section('content')
    <div class="py-5">
        <div class="card shadow-sm border-0 rounded-4 overflow-hidden">
            <div class="row g-0 align-items-start">
                <div class="col-md-5 p-5">
                    @if ($video->thumbnail)
                        <img src="{{ asset($video->thumbnail) }}" alt="{{ $video->title }}" class="img-fluid rounded-start"
                            style="object-fit: cover; width: 70%;">
                    @else
                        <div class="bg-secondary text-white d-flex align-items-center justify-content-center"
                            style="height: 250px; border-radius: .375rem 0 0 .375rem;">
                            <span class="fs-5 fw-semibold">No Thumbnail</span>
                        </div>
                    @endif
                </div>
                <div class="col-md-7 p-4">
                    <h2 class="fw-bold mb-3 text-truncate" title="{{ $video->title }}">{{ $video->title }}</h2>
                    <p class="text-muted mb-4"><small><strong>Type:</strong> {{ ucfirst($video->video_type) }}</small></p>

                    @if ($video->youtube_link)
                        <div class="ratio ratio-16x9 rounded overflow-hidden shadow-sm mb-3">
                            <iframe src="{{ $video->youtube_link }}" title="{{ $video->title }}" allowfullscreen
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                style="border: none;"></iframe>
                        </div>
                    @else
                        <p class="text-danger fst-italic">Video link or type not supported for preview.</p>
                    @endif
                </div>
            </div>
            <!-- Back Button -->
            <div class="mt-5 text-end m-4">
                <a href="{{ route('video.index') }}" class="btn btn-outline-secondary">
                    ← Back to All Videos
                </a>
            </div>
        </div>
    </div>

@endsection
