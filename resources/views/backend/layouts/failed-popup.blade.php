<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Payment Failed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .modal-content {
            border-radius: 1rem;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
            padding: 2rem 1.5rem;
        }

        .error-icon {
            font-size: 3rem;
            color: #dc3545;
            background: #fde8e8;
            border-radius: 50%;
            width: 80px;
            height: 80px;
            line-height: 80px;
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
            color: #dc3545;
        }

        .modal-body p {
            color: #555;
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }

        .redirect-msg {
            font-size: 0.9rem;
            color: #888;
        }
    </style>
</head>

<body>
    <!-- Modal -->
    <div class="modal fade show" id="failedModal" tabindex="-1" style="display:block;" aria-modal="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="error-icon">
                    ✕
                </div>
                <h5 class="modal-title">Payment Failed!</h5>
                <div class="modal-body">
                    <p>Unfortunately, your payment could not be processed.</p>
                    <p class="redirect-msg">You will be redirected shortly...</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Auto redirect after 3 seconds
        setTimeout(function() {
            window.location.href = "{{ $redirectUrl }}";
        }, 4000);
    </script>
</body>

</html>
