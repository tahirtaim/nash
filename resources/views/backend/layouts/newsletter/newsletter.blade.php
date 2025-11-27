<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>New Offer Alert</title>
</head>

<body
    style="margin:0; padding:30px; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color:#f4f6f8;">
    <div
        style="max-width:600px; margin:0 auto; background-color:#ffffff; border-radius:10px; padding:40px 30px; box-shadow:0 8px 20px rgba(0,0,0,0.05); text-align:center;">
        <h2 style="font-size:26px; color:#2c3e50; margin-bottom:20px;">🎉 New Offer Alert</h2>

        <p style="font-size:20px; font-weight:bold; color:#1abc9c; margin:15px 0;">
            {{ $offer->offer_name }}
        </p>

        <p style="font-size:16px; color:#555; line-height:1.6;">
            We’re excited to introduce a new addition to our collection. Be the first to check it out!
        </p>

        {{-- <a href="{{ route('offer.index') }}"
            style="display:inline-block; margin-top:25px; padding:12px 25px; background-color:#1abc9c; color:#ffffff; text-decoration:none; border-radius:6px; font-size:16px; font-weight:bold;">
            View Offer
        </a> --}}


        <div style="margin-top:40px; font-size:13px; color:#999;">
            © {{ date('Y') }} {{ config('app.name') }}. All rights reserved.
        </div>
    </div>
</body>

</html>
