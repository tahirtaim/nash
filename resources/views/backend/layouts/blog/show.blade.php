@extends('backend.master')

@section('title', $blog->title)

@section('content')
    <div class=" py-4">
        <div class="row justify-content-start">
            <div class="col-lg-9">

                <!-- Blog Card -->
                <div class="card border-0 shadow-sm rounded-3 overflow-hidden">
                    @if ($blog->image)
                        <img src="{{ asset($blog->image) }}" alt="{{ $blog->title }}" class="img-fluid w-100"
                            style="max-height: 450px; object-fit: cover;">
                    @endif

                    <div class="card-body px-4 py-4">
                        <h1 class="card-title mb-3 fw-bold">{{ $blog->title }}</h1>

                        <div class="mb-3 text-muted small">

                            <span class="mx-2">|</span>
                            <i class="bi bi-calendar me-1"></i> {{ $blog->created_at->format('F d, Y') }}
                        </div>

                        <div class="card-text fs-6" style="line-height: 1.8;">
                            {!! $blog->description !!}
                        </div>

                        <!-- Tags -->
                        @if ($blog->tags)
                            <div class="mt-4">
                                <strong class="me-2">Tags:</strong>
                                @foreach (explode(',', $blog->tags) as $tag)
                                    <span class="badge bg-light text-dark border me-1">{{ trim($tag) }}</span>
                                @endforeach
                            </div>
                        @endif

                        <!-- Back Button -->
                        <div class="mt-5 text-end">
                            <a href="{{ route('blog.index') }}" class="btn btn-outline-secondary">
                                ← Back to All Blogs
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection
