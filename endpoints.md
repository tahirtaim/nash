# API Endpoints

## Authentication

### Sign In

**Endpoint:** `POST /api/user-login`
**Description:** Authenticate a user and return a token.
**Parameters:**

- `email` (string, required): User's email.
- `password` (string, required): User's password.
  **Example Request:**

```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

### Sign Up

**Endpoint:** `POST /api/user-signup`
**Description:** Register a new user.
**Parameters:**

- `name` (string, required): User's name.
- `email` (string, required): User's email.
- `password` (string, required): User's password (min 8 chars, mixed case, numbers, symbols).
- `password_confirmation` (string, required): Confirm password.
  **Example Request:**

```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "Password@123",
  "password_confirmation": "Password@123"
}
```

### Logout

**Endpoint:** `POST /api/user-logout`
**Description:** Logout the authenticated user.
**Headers:** `Authorization: Bearer <token>`
**Example Request:**

```json
{}
```

### Send OTP (Forgot Password)

**Endpoint:** `POST /api/send-otp`
**Description:** Send OTP to email for password reset.
**Parameters:**

- `email` (string, required): User's email.
  **Example Request:**

```json
{
  "email": "john@example.com"
}
```

### Verify OTP (Forgot Password)

**Endpoint:** `POST /api/verify-otp`
**Description:** Verify the OTP sent for password reset.
**Parameters:**

- `email` (string, required): User's email.
- `otp` (string, required): 6-digit OTP.
  **Example Request:**

```json
{
  "email": "john@example.com",
  "otp": "123456"
}
```

### Reset Password

**Endpoint:** `POST /api/reset-password`
**Description:** Reset password using the token received after OTP verification.
**Parameters:**

- `email` (string, required): User's email.
- `password` (string, required): New password.
- `password_confirmation` (string, required): Confirm new password.
- `reset_token` (string, required): Token received from verify-otp.
  **Example Request:**

```json
{
  "email": "john@example.com",
  "password": "NewPassword@123",
  "password_confirmation": "NewPassword@123",
  "reset_token": "token_string"
}
```

### Verify Email OTP (Signup)

**Endpoint:** `POST /api/verify/email/otp`
**Description:** Verify OTP to complete signup.
**Parameters:**

- `email` (string, required): User's email.
- `otp` (string, required): 6-digit OTP.
  **Example Request:**

```json
{
  "email": "john@example.com",
  "otp": "123456"
}
```

### User Profile

**Endpoint:** `GET /api/user-profile`
**Description:** Get authenticated user's profile.
**Headers:** `Authorization: Bearer <token>`
**Example Request:**

```json
{}
```

### Update User Profile

**Endpoint:** `POST /api/update-user`
**Description:** Update user profile details.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `first_name` (string, required).
- `last_name` (string, required).
- `email` (string, required).
- `phone` (string, required).
- `address` (string, required).
- `town` (string, required).
- `zipcode` (string, optional).
- `state` (string, optional).
- `profile_photo` (file, optional).
  **Example Request:**

```json
{
  "first_name": "John",
  "last_name": "Doe",
  "email": "john@example.com",
  "phone": "12345678",
  "address": "123 Street",
  "town": "City"
}
```

### Delete Account

**Endpoint:** `POST /api/delete-account`
**Description:** Deactivate user account.
**Headers:** `Authorization: Bearer <token>`
**Example Request:**

```json
{}
```

### User Reset Password (Logged In)

**Endpoint:** `POST /api/user/profile/reset-password`
**Description:** Change password while logged in.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `current_password` (string, required).
- `new_password` (string, required).
- `new_password_confirmation` (string, required).
  **Example Request:**

```json
{
  "current_password": "OldPassword@123",
  "new_password": "NewPassword@123",
  "new_password_confirmation": "NewPassword@123"
}
```

## Banner

### Get Banner

**Endpoint:** `GET /api/get-banner`
**Description:** Get banner images.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

### Get About Us Content

**Endpoint:** `GET /api/get-aboutus-content`
**Description:** Get About Us page content.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

## Product

### Featured Products

**Endpoint:** `GET /api/get-featured-products`
**Description:** Get featured products.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

### All Products

**Endpoint:** `GET /api/get-all-products`
**Description:** Get all products.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

### Product Details

**Endpoint:** `POST /api/product-details`
**Description:** Get details of a specific product.
**Parameters:**

- `id` (integer, required): Product ID.
- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "id": 1,
  "language_id": 1
}
```

### Related Products

**Endpoint:** `POST /api/related-product`
**Description:** Get related products.
**Parameters:**

- `id` (integer, required): Product ID.
- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "id": 1,
  "language_id": 1
}
```

### Search Product

**Endpoint:** `POST /api/search/product`
**Description:** Search for products.
**Parameters:**

- `search_value` (string, required).
- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "search_value": "shirt",
  "language_id": 1
}
```

## Cart

### Add to Cart

**Endpoint:** `POST /api/add-to-cart/product`
**Description:** Add item to cart.
**Parameters:**

- `product_id` (integer, required): ID of product or offer.
- `p_type` (string, optional): 'product' or 'offer'.
  **Example Request:**

```json
{
  "product_id": 1,
  "p_type": "product"
}
```

### Get Cart Items

**Endpoint:** `GET /api/cart-items`
**Description:** Get cart items.
**Headers:** `Authorization: Bearer <token>`
**Example Request:**

```json
{}
```

### Delete Cart

**Endpoint:** `POST /api/delete-cart`
**Description:** Remove item from cart.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `cart_id` (integer, required).
  **Example Request:**

```json
{
  "cart_id": 1
}
```

## Offer

### All Offers

**Endpoint:** `GET /api/get-all-offers`
**Description:** Get all offers.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

### Offer Details

**Endpoint:** `GET /api/get-offers-details/{id}`
**Description:** Get offer details.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

## Blog

### All Blogs

**Endpoint:** `GET /api/get-all-blogs`
**Description:** Get all blogs.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

### Blog Details

**Endpoint:** `POST /api/get/blog-details`
**Description:** Get blog details.
**Parameters:**

- `blog_id` (integer, required).
- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "blog_id": 1,
  "language_id": 1
}
```

### Store Comment

**Endpoint:** `POST /api/blog/comment-store`
**Description:** Add a comment to a blog.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `blog_id` (integer, required).
- `name` (string, required).
- `email` (string, required).
- `comment` (string, required).
  **Example Request:**

```json
{
  "blog_id": 1,
  "name": "John",
  "email": "john@example.com",
  "comment": "Nice blog!"
}
```

### Get Comments

**Endpoint:** `POST /api/blog/get-comment`
**Description:** Get comments for a blog.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `blog_id` (integer, required).
  **Example Request:**

```json
{
  "blog_id": 1
}
```

## Video

### Featured Videos

**Endpoint:** `GET /api/get-featured-video`
**Description:** Get featured videos.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

### Popular Videos

**Endpoint:** `GET /api/get-popular-video`
**Description:** Get popular videos.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

## Review

### Get Reviews

**Endpoint:** `GET /api/get-review`
**Description:** Get all user reviews.
**Example Request:**

```json
{}
```

### Store Review

**Endpoint:** `POST /api/store-review`
**Description:** Submit a review.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `product_id` (integer, required).
- `review_content` (string, required).
- `rating_point` (numeric, required, 2-5).
  **Example Request:**

```json
{
  "product_id": 1,
  "review_content": "Great product!",
  "rating_point": 5
}
```

### Get Admin Reviews

**Endpoint:** `GET /api/get-admin/review`
**Description:** Get admin selected reviews.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

## About Us

### Contact Us

**Endpoint:** `GET /api/contact-us`
**Description:** Get contact information.
**Example Request:**

```json
{}
```

### Newsletter Store

**Endpoint:** `POST /api/newsletter-store`
**Description:** Subscribe to newsletter.
**Parameters:**

- `email` (string, required).
  **Example Request:**

```json
{
  "email": "john@example.com"
}
```

### Get In Touch

**Endpoint:** `POST /api/get-in-touch/store`
**Description:** Send a contact message.
**Parameters:**

- `full_name` (string, required).
- `subject` (string, required).
- `email_address` (string, required).
- `comment` (string, required).
  **Example Request:**

```json
{
  "full_name": "John Doe",
  "subject": "Inquiry",
  "email_address": "john@example.com",
  "comment": "Hello..."
}
```

## Utility

### Social Links

**Endpoint:** `GET /api/social`
**Description:** Get social media links.
**Example Request:**

```json
{}
```

### Wishlist Create

**Endpoint:** `POST /api/wishlist/create`
**Description:** Add product to wishlist.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `product_id` (integer, required).
  **Example Request:**

```json
{
  "product_id": 1
}
```

### Get Wishlist

**Endpoint:** `GET /api/wishlist`
**Description:** Get user's wishlist.
**Headers:** `Authorization: Bearer <token>`
**Example Request:**

```json
{}
```

### Wishlist Delete

**Endpoint:** `POST /api/wishlist-delete`
**Description:** Remove product from wishlist.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `product_id` (integer, required).
  **Example Request:**

```json
{
  "product_id": 1
}
```

### Get Logo

**Endpoint:** `GET /api/get-logo`
**Description:** Get site logo.
**Example Request:**

```json
{}
```

### Get Favicon

**Endpoint:** `GET /api/get-favicon`
**Description:** Get site favicon.
**Example Request:**

```json
{}
```

### Get All Dynamic Pages

**Endpoint:** `GET /api/get-all/dynamic-page`
**Description:** Get list of dynamic pages.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

### Get Dynamic Page Content

**Endpoint:** `GET /api/get-all/dynamic-page/content/{id}`
**Description:** Get content of a dynamic page.
**Parameters:**

- `language_id` (integer, optional).
  **Example Request:**

```json
{
  "language_id": 1
}
```

### Get Delivery Charge

**Endpoint:** `GET /api/get-delivery-charge`
**Description:** Get delivery charge.
**Example Request:**

```json
{}
```

## Order

### Place Order

**Endpoint:** `POST /api/order-create`
**Description:** Place a new order.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `name`, `email`, `phone`, `address`, `town`, `state`, `zipcode` (string, required).
- `subtotal`, `charge`, `total` (numeric, required).
- `payment_method` (string, required): 'cod' or 'hesabe'.
  **Example Request:**

```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "phone": "12345678",
  "address": "123 Street",
  "town": "City",
  "state": "State",
  "zipcode": "12345",
  "payment_method": "cod",
  "subtotal": 100,
  "charge": 5,
  "total": 105
}
```

### Order History

**Endpoint:** `POST /api/order-history/product`
**Description:** Get order history.
**Headers:** `Authorization: Bearer <token>`
**Example Request:**

```json
{}
```

## Promocode

### Get Promo

**Endpoint:** `GET /api/get-promo`
**Description:** Get active promo code.
**Example Request:**

```json
{}
```

### Apply Promo

**Endpoint:** `POST /api/apply-promo`
**Description:** Apply a promo code.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `code` (string, required).
- `order_amount` (numeric, required).
  **Example Request:**

```json
{
  "code": "SAVE10",
  "order_amount": 100
}
```

## Slider

### Get Page Slider

**Endpoint:** `POST /api/get_page_slider`
**Description:** Get slider for a specific page.
**Parameters:**

- `page_name` (string, required).
  **Example Request:**

```json
{
  "page_name": "home"
}
```

## Payment

### Process Payment

**Endpoint:** `POST /api/process-payment`
**Description:** Process a payment.
**Headers:** `Authorization: Bearer <token>`
**Parameters:**

- `cardNumber` (string, required).
- `expiryDate` (string, required).
- `cvv` (string, required).
- `amount` (numeric, required).
- `currency` (string, required).
  **Example Request:**

```json
{
  "cardNumber": "1234567890123456",
  "expiryDate": "12/25",
  "cvv": "123",
  "amount": 100,
  "currency": "KWD"
}
```
