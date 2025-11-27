<?php

use Faker\Provider\ar_EG\Payment;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BlogController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\OfferController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\VideoController;
use App\Http\Controllers\Api\ReviewController;
use App\Http\Controllers\Api\SliderController;
use App\Http\Controllers\Api\AboutUsController;
use App\Http\Controllers\Api\BannerControlller;
use App\Http\Controllers\Api\PaymentController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\UtilityController;
use App\Http\Controllers\Api\PromocodeController;

Route::controller(AuthController::class)->group(function () {
    Route::post('/user-login', 'login');
    Route::post('/user-signup', 'signup');
    Route::post('/user-logout', 'logout');
    // user otp verify
    Route::post('/send-otp',  'sendOtp');
    Route::post('/verify-otp',  'verifyOtp');
    Route::post('reset-password',  'resetPassword');
    Route::post('verify/email/otp', 'verifyEmailOtp');
    // user profile
    Route::get('/user-profile', [AuthController::class, 'userProfile'])->middleware('auth:api');
    Route::post('/update-user', [AuthController::class, 'updateUser']);
    Route::post('/delete-account', [AuthController::class, 'deleteSelfAccount'])->middleware('auth:api');
    Route::post('/user/profile/reset-password', [AuthController::class, 'userResetPassword'])->middleware('auth:api');
});

Route::controller(BannerControlller::class)->middleware('setLang')->group(function () {
    Route::get('/get-banner', 'getBanner');
    Route::get('/get-aboutus-content', 'getAboutUsContent'); //added about us content
});

Route::controller(ProductController::class)->middleware('setLang')->group(function () {
    Route::get('/get-featured-products', 'featuredProducts');
    Route::get('/get-all-products', 'allProducts');
    Route::post('/product-details', 'productDetails');
    Route::post('/related-product', 'relatedProduct');
    Route::post('/search/product', 'searchProduct');
});

Route::controller(CartController::class)->group(function () {
    Route::post('/add-to-cart/product', 'addToCart');
    Route::get('/cart-items', 'getCartItems')->middleware('auth:api');
    Route::post('/delete-cart', 'destroyCart')->middleware('auth:api');
});

Route::controller(OfferController::class)->middleware('setLang')->group(function () {
    Route::get('/get-all-offers', 'allOffer');
    Route::get('/get-offers-details/{id}', 'offerDetails');
});
Route::controller(BlogController::class)->group(function () {
    Route::get('/get-all-blogs', 'allBlog')->middleware('setLang');
    Route::post('/get/blog-details', 'blogDetails')->middleware('setLang');
    Route::post('/blog/comment-store', 'commentStore')->middleware('auth:api');
    Route::post('/blog/get-comment', 'getComment')->middleware('auth:api');
});

Route::controller(VideoController::class)->middleware('setLang')->group(function () {
    Route::get('/get-featured-video', 'getFeaturedVideos');
    Route::get('/get-popular-video', 'getPopularVideos');
});

Route::controller(ReviewController::class)->group(function () {
    Route::get('/get-review', 'getReview');
    Route::post('/store-review', 'storeReview')->middleware('auth:api');
    Route::get('/get-admin/review', 'getAdminReview')->middleware('setLang');
});

Route::controller(AboutUsController::class)->group(function () {
    Route::get('/contact-us', 'contactUs');
    Route::post('/newsletter-store', 'storeNewsletter');
    Route::post('/get-in-touch/store', 'getInTouch');
});

Route::controller(UtilityController::class)->group(function () {
    Route::get('/social', 'social');
    Route::post('/wishlist-delete', 'wishlistDelete')->middleware('auth:api');
    Route::post('/wishlist/create', 'wishList')->middleware('auth:api');
    Route::get('/wishlist', 'getWishlist')->middleware('auth:api');
    Route::get('/get-logo', 'getLogo');
    Route::get('/get-favicon', 'getFavicon');
    Route::get('/get-all/dynamic-page', 'getAllDynamicPage')->middleware('setLang');
    Route::get('/get-all/dynamic-page/content/{id}', 'getDynamicPageContent')->middleware('setLang');
    Route::get('/get-delivery-charge', 'getDeliveryCharge');
});


Route::controller(OrderController::class)->middleware('auth:api')->group(function () {
    Route::post('/order-create', 'store');
    Route::post('/order-history/product', 'orderHistory');
});



Route::controller(PromocodeController::class)->group(function () {
    Route::get('/get-promo', 'GetPromo');
    Route::post('/apply-promo', 'apply')->middleware('auth:api');
});

Route::controller(SliderController::class)->group(function () {
    Route::post('/get_page_slider', 'getPageSlider');
});


Route::controller(PaymentController::class)->middleware('auth:api')->group(function () {

    Route::post('/process-payment', [PaymentController::class, 'processPayment']);
    
});