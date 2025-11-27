<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Payment Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .modal-content {
            border-radius: 1rem;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
            padding: 2rem 1.5rem;
        }

        .success-icon {
            font-size: 3rem;
            color: #28a745;
            background: #e9f9ee;
            border-radius: 50%;
            width: 80px;
            height: 80px;
            margin: 0 auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: pop 0.4s ease-in-out;
        }

        @keyframes pop {
            0% {
                transform: scale(0.5);
                opacity: 0;
            }

            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        .modal-title {
            font-weight: 600;
            font-size: 1.5rem;
            color: #28a745;
        }

        .modal-body p {
            color: #555;
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-outline-success {
            border: 1px solid #28a745;
            color: #28a745;
        }

        .btn-outline-success:hover {
            background-color: #28a745;
            color: #fff;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 1rem;
        }
    </style>
</head>

<body>
    <!-- Payment Success Modal -->
    <div class="modal fade show" id="successModal" tabindex="-1" style="display:block;" aria-modal="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="success-icon">✓</div>
                <h5 class="modal-title">Payment Successful!</h5>
                <div class="modal-body">
                    <p>Your payment has been received successfully.</p>

                    <div class="btn-group">
                        <a href="{{ $redirectUrl }}" class="btn btn-success">Go to Profile</a>
                        <a href={{ $shop }} class="btn btn-outline-success">Continue Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
