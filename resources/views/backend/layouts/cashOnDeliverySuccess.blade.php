<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .success-icon .checkmark-circle {
        width: 80px;
        height: 80px;
        position: relative;
        display: inline-block;
    }
    .success-icon .background {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        background: #d4edda;
        position: absolute;
        top: 0;
        left: 0;
    }
    .success-icon .checkmark {
        position: absolute;
        left: 26px;
        top: 40px;
        width: 25px;
        height: 12px;
        border-left: 3px solid #28a745;
        border-bottom: 3px solid #28a745;
        transform: rotate(-45deg);
        animation: drawCheck 0.6s ease forwards;
    }
    @keyframes drawCheck {
        from {
            opacity: 0;
            transform: rotate(-45deg) scale(0.5);
        }
        to {
            opacity: 1;
            transform: rotate(-45deg) scale(1);
        }
    }
    .modal-content {
        animation: slideUp 0.4s ease;
    }
    @keyframes slideUp {
        from {
            transform: translateY(40px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }
    </style>
</head>

<body>
  <!-- Success Modal -->
<div class="modal fade show" id="successModal" tabindex="-1" style="display: block; background: rgba(0,0,0,0.6);" aria-modal="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg rounded-4">
            <div class="text-center p-4">

                <!-- Success Icon -->
                <div class="success-icon mx-auto mb-3">
                    <div class="checkmark-circle">
                        <div class="background"></div>
                        <div class="checkmark draw"></div>
                    </div>
                </div>

                <!-- Title -->
                <h4 class="fw-bold text-success mb-2">Order Placed Successfully!</h4>

                <!-- Message -->
                <p class="text-muted mb-4">
                    Your order has been placed successfully with <strong>Cash on Delivery</strong>.
                </p>

                <!-- Buttons -->
                <div class="d-flex justify-content-center gap-3 mt-3">
                    <a href="{{ $shop }}" class="btn btn-success px-4 rounded-pill shadow-sm">
                        🛍 Continue Shopping
                    </a>
                    <a href="{{ $redirectUrl }}" class="btn btn-outline-success px-4 rounded-pill">
                        👤 View Profile
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>



    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
