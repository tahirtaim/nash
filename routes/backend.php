<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SliderController;
use App\Http\Controllers\Blog\BlogController;
use App\Http\Controllers\Offer\OfferController;
use App\Http\Controllers\Order\OrderController;
use App\Http\Controllers\Video\VideoController;
use App\Http\Controllers\Banner\BannerController;
use App\Http\Controllers\Review\ReviewController;
use App\Http\Controllers\Backend\BackendController;
use App\Http\Controllers\Product\ProductController;
use App\Http\Controllers\Settings\SystemController;
use App\Http\Controllers\Utility\UtilityController;
use App\Http\Controllers\Category\CategoryController;
use App\Http\Controllers\Backend\AboutUsPageController;
use App\Http\Controllers\Dynamic\DynamicPageController;
use App\Http\Controllers\Promocode\PromocodeController;
use App\Http\Controllers\RolePermission\RoleController;
use App\Http\Controllers\Settings\MailSettingController;
use App\Http\Controllers\Settings\AdminSettingsController;
use App\Http\Controllers\RolePermission\UserRollController;
use App\Http\Controllers\Settings\ProfileSettingController;
use App\Http\Controllers\RolePermission\PermissionController;
use App\Http\Controllers\RolePermission\RolePermissionController;

// Route::get('/', [BackendController::class, 'Page404'])->name('dashboard');
Route::controller(BackendController::class)->middleware('auth.check')->group(function () {
    Route::get('/', 'index')->name('dashboard');
    Route::get('/dashboard-data', 'monthlyData');
});

// About Us Section Routes - newly added
Route::controller(AboutUsPageController::class)->middleware('auth.check')->group(function () {
    Route::get('/aboutus-settings', 'edit')->name('aboutus.edit');
    Route::get('/aboutus-settings/{languageId}', 'getAboutUs')->name('aboutus.get');
    Route::post('/aboutus-settings/update/{languageId}', 'updateAboutUs')->name('aboutus.update');
});

Route::controller(DynamicPageController::class)->middleware('auth.check')->group(function () {
    Route::resource('dynamic-pages', DynamicPageController::class);
    Route::get('/dynamic/pages/destroy/{id}', 'destroy')->name('dynamic-pages.delete');
    Route::get('/dynamic/pages/toggle-status/{id}/{status}', 'pageSatus')->name('dynamic-pages.toggleStatus');
});

Route::controller(ReviewController::class)->middleware('auth.check')->group(function () {
    Route::resource('review', ReviewController::class);
    Route::get('/review/destroy/{id}', 'destroy')->name('review.delete');
    Route::post('/review/change-status', 'changeStatus')->name('review.changeStatus');
    Route::get('/review/user/create', 'userReview')->name('users.create.review');
    Route::post('/review/user/change-status', 'changeUserStatus')->name('review.change.user.status');
    Route::get('/review/user/show/{id}', 'showUserReview')->name('user-review.show');
});

Route::controller(OfferController::class)->middleware('auth.check')->group(function () {
    Route::get('offer/load-products', 'loadProducts')->name('offer.loadproducts');
    Route::resource('offer', OfferController::class);
    Route::get('/offer/destroy/{id}', 'destroy')->name('offer.delete');
    Route::get('/offer/status/{id}/{status}', 'changeStatus')->name('offer.status.change');
});

Route::controller(VideoController::class)->middleware('auth.check')->group(function () {
    Route::resource('video', VideoController::class);
    Route::get('/video/destroy/{id}', 'destroy')->name('video.delete');
    Route::get('/video/status/{id}/{video_type}', 'changeStatus')->name('video.status.change');
});

Route::controller(BlogController::class)->middleware('auth.check')->group(function () {
    Route::resource('blog', BlogController::class);
    Route::get('/blog/destroy/{id}', 'destroy')->name('blog.delete');
    Route::get('/blog/status/{id}/{status}', 'changeStatus')->name('blog.status.change');
});

Route::controller(BannerController::class)->middleware(['web', 'auth.check'])->group(function () {
    Route::resource('banner', BannerController::class);
    Route::get('/banner/destroy/{id}', 'destroy')->name('banner.delete');
    Route::get('/banner/status/{id}/{status}', 'changeStatus')->name('banner.status.change');
});

Route::controller(ProductController::class)->middleware('auth.check')->group(function () {
    Route::get('/product/index', 'index')->name('product.index');
    Route::get('/product/show/{id}', 'show')->name('product.show');
    Route::get('/product/create', 'create')->name('product.create');
    Route::post('/product/store', 'store')->name('product.store');
    Route::get('/product/edit/{id}', 'edit')->name('product.edit');
    Route::put('/product/update/{id}', 'update')->name('product.update');
    Route::get('/product/destroy/{id}', 'destroy')->name('product.destroy');
    Route::get('product/status/{id}/{status}', 'changeStatus')->name('product.status');
    Route::delete('/product/image/destroy/{id}', 'productImageDestroy')->name('product.image.destroy');

    Route::get('/get-categories-by-language/{lang_id}', 'getCategoriesByLanguage')->name('product.categoriesbylanguage');

});


Route::controller(PromocodeController::class)->middleware('auth.check')->group(function () {
    Route::get('/promocode/index', 'index')->name('promocode.index');
    Route::get('/promocode/create', 'create')->name('promocode.create');
    Route::get('/promocode/show', 'show')->name('promocode.show');
    Route::post('/promocode/store', 'store')->name('promocode.store');
    Route::delete('/promocode/destroy/{id}', 'destroy')->name('promocode.destroy');
    Route::get('/promocode/edit/{id}', 'edit')->name('promocode.edit');
    Route::put('/promocode/update/{id}', 'update')->name('promocode.update');
    Route::patch('/promocode/toggle-status/{id}', 'toggleStatus')->name('promocode.toggleStatus');
});

Route::controller(CategoryController::class)->middleware('auth.check')->group(function () {
    Route::get('/category/index', 'index')->name('category.index');
    Route::post('/category/store', 'store')->name('category.store');
    Route::get('/category/destroy/{category_id}', 'destroy')->name('category.destroy');
    Route::get('/category/edit/{category_id}', 'edit')->name('category.edit');
    Route::put('/category/update/{category_id}', 'update')->name('category.update');
    Route::get('/category/{category_id}/toggle-status', 'toggleStatus')->name('category.Toggle.status');
});

Route::controller(MailSettingController::class)->middleware('auth.check')->group(function () {
    Route::get('/settings/mail', 'index')->name('mail.index');
    Route::post('/settings/mail-store', 'mailstore')->name('mail.store');
});

Route::controller(ProfileSettingController::class)->middleware('auth.check')->group(function () {
    Route::get('/settings/profile', 'index')->name('profile.index');
    Route::post('/settings/profile-update', 'profileupdate')->name('profile.update');
    Route::post('/settings/profile-password-update', 'PasswordUpdate')->name('profile.password.update');
});

Route::controller(SystemController::class)->middleware('auth.check')->group(function () {
    Route::get('/settings/system', 'index')->name('system.index');
    Route::post('/settings/system-store', 'systemupdate')->name('system.update');
    Route::post('/settings/social-store', 'updateSocials')->name('social.update');
    Route::post('/settings/feature-section-update', 'updateFeatureSection')->name('feature.section.update');
});

Route::controller(AdminSettingsController::class)->middleware('auth.check')->group(function () {
    Route::get('/settings/admin', 'index')->name('admin.setting.index');
    Route::post('/settings/admin/update', 'adminSettingUpdate')->name('admin.setting.update');
    Route::post('/settings/admin/set/invoice_number', 'SetInvoiceNumber')->name('set.invoice.number');
    Route::post('/settings/admin/set/delivery_charge', 'setDeliveryCharge')->name('set.delivery.charge');
    Route::post('/setting.set_invoice', 'SetInvoiceSetting')->name("set.invoice.setting");
});

Route::controller(OrderController::class)->middleware('auth.check')->group(function () {
    Route::resource('order', OrderController::class);
    Route::get('/order/destroy/{id}', 'destroy')->name('order.delete');
    Route::get('/order/invoiceshow/{order_number}', 'invoiceshow')->name('order.invoiceshow');
    Route::get('/order/updatestatus/{id}/{status}', 'updatestatus')->name('order.updatestatus');
    Route::get('orders/accept/{id}/{status}', 'accept')->name('orders.accept');
    Route::get('orders/reject/{id}/{status}', 'reject')->name('orders.reject');
    //invoixe download
    Route::get('/download-pdf/{id}', [OrderController::class, 'downloadPDF'])->name('download.pdf');
});
Route::get('/cash-order-successfull-message', [OrderController::class, 'successPopup'])->name('cash.order.popup');
// hesabe payment
Route::get('/hesabe/callback', [OrderController::class, 'callback'])->name('hesabe.callback');
Route::get('/hesabe/failed', [OrderController::class, 'failed'])->name('hesabe.failed');




Route::controller(UtilityController::class)->middleware('auth.check')->group(function () {
    Route::get('get/newsletter-all', 'newsletter')->name('get.newsletter.index');
    Route::get('newsletter/delete/{id}', 'newsletterDelete')->name('newsletter.delete');
});

// user management
// Route::controller(UserController::class)->middleware('auth.check')->group(function () {
//     Route::get('/user/index', 'index')->name('user.index');
//     Route::post('/user/store', 'store')->name('user.store');
//     Route::get('/user/edit/{id}', 'edit')->name('user.edit');
//     Route::put('/user/update/{id}', 'update')->name('user.update');
//     Route::get('/user/destroy/{id}', 'destroy')->name('user.destroy');
//     Route::get('/user/show/{id}', 'show')->name('user.show');
//     Route::get('/user/status/{id}/{status}', 'changeStatus')->name('user.status.change');
// });

// Stripe payment  route
// Route::get('/stripe/success', [OrderController::class, 'stripeSuccess'])->name('stripe.success');
// Route::get('/stripe/cancel', [OrderController::class, 'stripeCancel'])->name('stripe.cancel');;



// Role and Permission Management start
Route::controller(RoleController::class)->middleware('auth.check')->group(function () {
    Route::get('/role/index', 'index')->name('role.index');
    Route::post('/role/store', 'store')->name('role.store');
    Route::get('/role/destroy/{id}', 'destroy')->name('role.destroy');
    Route::get('/role/edit/{id}', 'edit')->name('role.edit');
    Route::put('/role/update/{id}', 'update')->name('role.update');
    Route::get('/permission/edit/{id}', 'editPermission')->name('permission.edit');
});

Route::controller(RolePermissionController::class)->middleware('auth.check')->group(function () {});

Route::controller(UserRollController::class)->middleware('auth.check')->group(function () {
    Route::get('/user/index', 'index')->name('user.index');
    Route::post('/user/store', 'store')->name('user.store');
    Route::get('/user/edit/{id}', 'edit')->name('user.edit');
    Route::put('/user/update/{id}', 'update')->name('user.update');
    Route::get('/user/destroy/{id}', 'destroy')->name('user.destroy');
    Route::get('/user/show/{id}', 'show')->name('user.show');
    Route::get('/user/role/change/{id}', 'ChangeRole')->name('user.role.change');
    Route::post('/user/role/Update/{id}', 'assignRoleUpdate')->name('user.role.update');
});

Route::controller(PermissionController::class)->middleware('auth.check')->group(function () {
    Route::get('/permission/index', 'index')->name('permission.index');
    Route::post('/permission/store', 'store')->name('permission.store');
    // Route::get('/permission/destroy/{id}', 'destroy')->name('permission.destroy');
    Route::post('role/permission/update/{id}', 'UpdatePermissionByRole')->name('role.permission.update');
});

Route::controller(SliderController::class)->middleware('auth.check')->group(function () {
    Route::get('/slider', 'index')->name('slider.index');
    Route::get('/slider/create', 'create')->name('slider.create');
    Route::post('/slider/store', 'store')->name('slider.store');
    Route::get('/slider/edit/{id}', 'edit')->name('slider.edit');
    Route::put('/slider/update/{id}', 'update')->name('slider.update');
    Route::get('/slider/destroy/{id}', 'destroy')->name('slider.destroy');
});
