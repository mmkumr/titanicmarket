@extends ('layout')
@section ('title', 'Checkout')
@section ('content')
    <!--================Checkout Area =================-->
    <section class="checkout_area section_gap" style = "padding-top:150px">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <h3>Billing Details</h3>
                            <form class="row contact_form" id="payment-form" action="{{ route('checkout.store') }}" method="POST">
                                {{ csrf_field() }}
                                <div class="col-md-6 form-group">
                                    @if (auth()->user())
                                    <input type="email" class="form-control" id="email" name="email" value="{{ auth()->user()->email }}"readonly>
                                    @else
                                    <input type="email" class="form-control" id="email" name="email" value="{{ old('email') }}" placeholder = "Email" required>
                                    @endif                            
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="name" name="name" value="{{$name}}" placeholder = "Name" required>
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="address" name="address" value="{{$address}}" placeholder = "Name" required>                            
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="city" name="city" value="{{$city}}" placeholder = "City" required>
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="postalcode" name="postalcode" value="{{$pin_code}}" placeholder = "Pin Code" required>
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <input type="text" class="form-control" id="province" name="province" value="{{$state}}" placeholder = "City" required>
                                </div>
                                <div class="col-md-6 form-group p_star">
                                    <input type="tel" class="form-control" id="phone" name="phone" value="{{$phone}}" placeholder = "Pin Code" required>
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="name_on_card" name="name_on_card" placeholder = "Name on the Card">
                                </div>
                            </form>
                            <a class="primary-btn" href="#" onclick="document.getElementById('payment-form').submit()">Complete Order</a>
                    </div>
                    <div class="col-lg-4">
                        <div class="order_box">
                            <h2>Your Order</h2>
                            <ul class="list">
                                <li><a href="#">Product <span>Total</span></a></li>
                                <li><a href="#">Fresh Blackberry <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                                <li><a href="#">Fresh Tomatoes <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                                <li><a href="#">Fresh Brocoli <span class="middle">x 02</span> <span class="last">$720.00</span></a></li>
                            </ul>
                            <ul class="list list_2">
                                <li><a href="#">Subtotal <span>$2160.00</span></a></li>
                                <li><a href="#">Shipping <span>Flat rate: $50.00</span></a></li>
                                <li><a href="#">Total <span>$2210.00</span></a></li>
                            </ul>
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option5" name="selector">
                                    <label for="f-option5">Check payments</label>
                                    <div class="check"></div>
                                </div>
                                <p>Please send a check to Store Name, Store Street, Store Town, Store State / County,
                                    Store Postcode.</p>
                            </div>
                            <div class="payment_item active">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option6" name="selector">
                                    <label for="f-option6">Paypal </label>
                                    <img src="img/product/card.jpg" alt="">
                                    <div class="check"></div>
                                </div>
                                <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal
                                    account.</p>
                            </div>
                            <div class="creat_account">
                                <input type="checkbox" id="f-option4" name="selector">
                                <label for="f-option4">I’ve read and accept the </label>
                                <a href="#">terms & conditions*</a>
                            </div>
                            <a class="primary-btn" href="#">Proceed to Paypal</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Checkout Area =================-->
@endsection 
@section ('extra-js')
<script src="https://js.braintreegateway.com/web/dropin/1.13.0/js/dropin.min.js"></script>
<script>
    (function(){
        // Create a Stripe client
        var stripe = Stripe('{{ config('services.stripe.key') }}');
    
        // Create an instance of Elements
        var elements = stripe.elements();
    
        // Custom styling can be passed to options when creating an Element.
        // (Note that this demo uses a wider set of styles than the guide below.)
        var style = {
          base: {
            color: '#32325d',
            lineHeight: '18px',
            fontFamily: '"Roboto", Helvetica Neue", Helvetica, sans-serif',
            fontSmoothing: 'antialiased',
            fontSize: '16px',
            '::placeholder': {
              color: '#aab7c4'
            }
          },
          invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
          }
        };
    
        // Create an instance of the card Element
        var card = elements.create('card', {
            style: style,
            hidePostalCode: true
        });
    
        // Add an instance of the card Element into the `card-element` <div>
        card.mount('#card-element');
    
        // Handle real-time validation errors from the card Element.
        card.addEventListener('change', function(event) {
          var displayError = document.getElementById('card-errors');
          if (event.error) {
            displayError.textContent = event.error.message;
          } else {
            displayError.textContent = '';
          }
        });
    
        // Handle form submission
        var form = document.getElementById('payment-form');
        form.addEventListener('submit', function(event) {
          event.preventDefault();
    
          // Disable the submit button to prevent repeated clicks
          document.getElementById('complete-order').disabled = true;
    
          var options = {
            name: document.getElementById('name_on_card').value,
            address_line1: document.getElementById('address').value,
            address_city: document.getElementById('city').value,
            address_state: document.getElementById('province').value,
            address_zip: document.getElementById('postalcode').value
          }
    
          stripe.createToken(card, options).then(function(result) {
            if (result.error) {
              // Inform the user if there was an error
              var errorElement = document.getElementById('card-errors');
              errorElement.textContent = result.error.message;
    
              // Enable the submit button
              document.getElementById('complete-order').disabled = false;
            } else {
              // Send the token to your server
              stripeTokenHandler(result.token);
            }
          });
        });
    
        function stripeTokenHandler(token) {
          // Insert the token ID into the form so it gets submitted to the server
          var form = document.getElementById('payment-form');
          var hiddenInput = document.createElement('input');
          hiddenInput.setAttribute('type', 'hidden');
          hiddenInput.setAttribute('name', 'stripeToken');
          hiddenInput.setAttribute('value', token.id);
          form.appendChild(hiddenInput);
    
          // Submit the form
          form.submit();
        }
    
        // PayPal Stuff
        var form = document.querySelector('#paypal-payment-form');
        var client_token = "{{ $paypalToken }}";
    
        braintree.dropin.create({
          authorization: client_token,
          selector: '#bt-dropin',
          paypal: {
            flow: 'vault'
          }
        }, function (createErr, instance) {
          if (createErr) {
            console.log('Create Error', createErr);
            return;
          }
    
          // remove credit card option
          var elem = document.querySelector('.braintree-option__card');
          elem.parentNode.removeChild(elem);
    
          form.addEventListener('submit', function (event) {
            event.preventDefault();
    
            instance.requestPaymentMethod(function (err, payload) {
              if (err) {
                console.log('Request Payment Method Error', err);
                return;
              }
    
              // Add the nonce to the form and submit
              document.querySelector('#nonce').value = payload.nonce;
              form.submit();
            });
          });
        });
    
    })();
</script>
@endsection
