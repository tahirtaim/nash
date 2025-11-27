{{-- resources/views/offer/show.blade.php --}}
@extends('backend.master')

@section('title', $offer->offer_name)

@section('content')
    <div class="promo-container d-flex justify-content-center align-items-center">
        <img src="{{ asset($offer->image) }}" alt="{{ $offer->offer_name }}" class="bg-image">
        <div class="content-overlay container">
            <div class="row h-100 align-items-center">
                {{-- Left side content (Offer Details) --}}
                <div class="col-12 col-md-6 d-flex flex-column justify-content-center align-items-start text-white">
                    <h1 class="special-text">Special</h1>
                    <div class="offer-bubble">
                        <h2 class="display-1 fw-bold">{{ $offer->discount_value }}% Off</h2>
                    </div>

                    <div class="details-box">
                        <h3 class="details-title">{{ $offer->offer_name }}</h3>
                        <p class="details-text">
                            {{ \Carbon\Carbon::parse($offer->offer_start_date)->format('M d, Y') }} to
                            {{ \Carbon\Carbon::parse($offer->offer_end_date)->format('M d, Y') }}.<br>
                            This offer is applicable for the product <strong>{{ $offer->offer_name }}</strong>.
                        </p>
                    </div>
                </div>

                {{-- Right side content ("New Store!") --}}
                <div class="col-12 col-md-6 d-flex flex-column justify-content-start align-items-end text-end">
                    <h1 class="new-store-text">New Store!</h1>
                </div>
            </div>
        </div>

        {{-- Back Button --}}
        <div class="back-btn-container">
            <a href="{{ route('offer.index') }}" class="btn btn-outline-light btn-lg">
                ← Back to All Offers
            </a>
        </div>

    </div>

@endsection
