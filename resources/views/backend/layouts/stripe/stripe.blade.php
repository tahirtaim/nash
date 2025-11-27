<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stripe Payment</title>
    <script src="https://js.stripe.com/v3/"></script>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        body {
            font-family: 'Helvetica', sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .payment-container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 420px;
        }

        h2 {
            margin-bottom: 25px;
            font-size: 1.6rem;
            text-align: center;
            color: #333;
        }

        #card-element {
            border: 1px solid #ddd;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            background-color: #fafafa;
        }

        #submit {
            width: 100%;
            background-color: #6772e5;
            color: white;
            font-size: 16px;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #submit:hover {
            background-color: #5469d4;
        }

        #payment-result {
            margin-top: 15px;
            text-align: center;
            font-weight: 500;
        }
    </style>
</head>

<body>
    <div class="payment-container">
        <h2>Complete Your Payment</h2>

        <form id="payment-form">
            <div id="card-element"></div>
            <button type="submit" id="submit">Pay Now</button>
        </form>

        <div id="payment-result"></div>
    </div>

    <script>
        const stripe = Stripe("{{ env('STRIPE_KEY') }}"); // publishable key
        const elements = stripe.elements();
        const cardElement = elements.create('card', {
            hidePostalCode: true
        });
        cardElement.mount('#card-element');

        const form = document.getElementById('payment-form');
        const resultDiv = document.getElementById('payment-result');

        form.addEventListener('submit', async (e) => {
            e.preventDefault();

            // Disable button to prevent multiple clicks
            document.getElementById('submit').disabled = true;

            // 1. Call backend to create PaymentIntent
            let response = await fetch("{{ route('pay.intent') }}", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').getAttribute(
                        'content')
                },
                body: JSON.stringify({})
            });

            let data = await response.json();
            const clientSecret = data.clientSecret;

            // 2. Confirm payment on frontend
            const {
                paymentIntent,
                error
            } = await stripe.confirmCardPayment(clientSecret, {
                payment_method: {
                    card: cardElement
                }
            });

            if (error) {
                resultDiv.innerHTML = `<p style="color:red;">❌ ${error.message}</p>`;
                document.getElementById('submit').disabled = false;
            } else if (paymentIntent.status === "succeeded") {
                resultDiv.innerHTML = `<p style="color:green;">✅ Payment Successful!</p>`;
            }
        });
    </script>
</body>

</html>
