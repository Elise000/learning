# Braintree Payment System
This is a guide to show how to integrate Braintree into Rails. This guide is
going to demonstrate that transaction itself is an independent Model View
Controller (MVC).

<br>
A demo repo was prepared for code understanding. It can be found in
https://github.com/hollowaykeanho/rails-braintree-demo.

<br><hr><br><br>

## Assumptions
1. You know your Rails very well.
2. You know git.


<br><hr><br><br>

## Steps
### 1) Setup Figaro for sensitive Braintree app information.
You can execute the steps here:
https://github.com/hollowaykeanho/learning/tree/master/rails/gems/figaro
.

<br><hr><br><br>

### 2) Add Braintree gem into Gemfile.
```
gem 'braintree'
```

<br><hr><br><br>

### 3) Create an initializer file ```/config/initializers/braintree.rb```:
```
Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log')
Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT_ID']
Braintree::Configuration.public_key = ENV['BRAINTREE_PUBLIC_KEY']
Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY']
```

<br><hr><br><br>

### 4) Sign up for Braintree account (in this demo, we'll be using Sandbox).
You can sign up for an account here: https://www.braintreepayments.com/
.

<br>
Upon sign up, reterive your merchant id, public key and private key. We'll
be using these sensitive information in the next step.

<br><hr><br><br>

### 5) Insert the keys and id into ```config/application.yml```
> **NOTE**:
>
> If you don't have such file, your Figaro is not setup properly. Please refer
> Step #1.

<br>
```
default: &default
  BRAINTREE_MERCHANT_ID: argaegjaehkaelae
  BRAINTREE_PUBLIC_KEY: aerkjgalejglaeglawg
  BRAINTREE_PRIVATE_KEY: argiajheglaewhgiwlo23bo4213423wegwegw23

development:
  <<: *default

test:
  <<: *default

production:
  <<: *default
```

> **NOTE**:
>
> Ensure the symbol (e.g: BRAINTREE_MERCHANT_ID) is the same as the symbol
> used inside the Braintree initializer. In other words, ruby is obtaining
> these sensitive information from the environment variables.

<br><hr><br><br>

### 6) Generate a new MVC model for 'payments'
We'll create a simple payment MVC for payment transaction. For rapid
prototyping, let's keep the tracking information as minimal as possible.

```
$ rails g controller payments new
$ rails g model payment
```

<br><hr><br><br>

### 7) Set the route for payment MVC, only new and create
```
resources payments, only: [:new, :create]
```

> **NOTE**:
>
> In later future, you can enable index and show for admin management.

<br><hr><br><br>

### 8) Setup the controller for new and create
```
class PaymentsController < ApplicationController
  before_action do_some_security_activity_available, only: [:new, :create]

  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find_by(secure_token: params[:secure_token])
    @payment = Payment.new
  end

  def create
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "10.00",
      payment_method_nonce: params[:payment_method_nonce]
    )

    # reserve to save the transaction details into database

    redirect_to reservations_path
  end

  ...

end
```

> NOTE:
>
> The idea is that, you have your order page (e.g above: Reservation) which
> setups the transaction details.
>
> <br>
> In this example, the Reservation creates a secure token and the transaction
> details to be passed to the payment MVC on the frontend. This reduces as
> much information control back to your backend.
>
> <br>
> Payment MVC reterive the transaction's secure_token from front end. Then,
> it will work on reteriving the information from backend server, using the
> secure token and prepare the payment page.
>
> bottomline: when it comes to payment, for security purpose, reduce as much
> control as possible for client and ensures many operations only operates
> at backend.

<br><hr><br><br>

### 9) Add the "Pay" button link on your order page
There are at least 5 ways of transferring the secure token from order page to
payment page. In there, we'll be using URL parameter transfer.

The link looks something like this:
```
<%= link_to 'Pay Now', new_payment_path + "?id=" + @reservation.secure_token.to_s %>
```

> NOTE:
>
> You can explore other means of transferring the information, such as through
> sessions or cookie (although highly discouraged for security reason). 

<br>

> NOTE:
>
> Secure token can be pre-configured when your order model is newly created.
> Remember to save the same token inside your order page.

<br><hr><br><br>

### 10) Ensures your payment form shows only static information for client in ```views/payments/new.html.erb```
In payment page, orders are confirmed. Please ensures that you show the order's
information only for viewing purposes. **Please avoid using text field etc**
since we don't want to change the transaction details.

<br>
From your controller's new action: 
```
  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find_by(secure_token: params[:secure_token])
    @payment = Payment.new
  end
```

<br>
An example looks something like this:

```
<h1>That's all for your order:</h1>


<%= form_for(@payment) do |f| %>

  <div class="field">
    <%= f.label :start_date %><br>
    <%= @reservation.start_date %><br>
  </div>
  <div class="field">
    <%= f.label :end_date %><br>
    <%= @reservation.end_date %><br>
  </div>
  <div class="field">
    <%= f.hidden_field :reservation_secure_token, value: @reservation.secure_token %><br>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>

<% end %>

```

<br><hr><br><br>

### 11) Add Braintree javascript header to ```views/layouts/application.html.erb```
We'll need braintree javascript to process their payment gateway code.
Include the following line below the javascript include tag.

```
<script src="https://js.braintreegateway.com/v2/braintree.js"></script>
```

<br>
The output looks soemthing like this:

```
<head>
  <title>Braintree</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => false %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => false %>
  <script src="https://js.braintreegateway.com/v2/braintree.js"></script>
  <%= csrf_meta_tags %>
</head>
```

<br><hr><br><br>

### 12) Add the Braintree payment codes inside the payment form
In ```views/payments/new.html.erb```, add in the Braintree div tag and its
specific javascript code.

<br>
The div tag:
```
<div class="field">
  <div id="dropin"></div>
</div>
```

<br>
The script:
```
<script type="text/javascript">
  function setupBT() {
    braintree.setup("<%= @client_token %>", 'dropin', {
      container: 'dropin'
    });
  }

  if (window.addEventListener)
    window.addEventListener("load", setupBT, false);
  else if (window.attachEvent)
    window.attachEvent("onload", setupBT);
  else window.onload = setupBT;

</script>
```

<br>
An final output example for ```views/payments/new.html.erb``` would be:
```
<h1>That's all for your order:</h1>


<%= form_for(@payment) do |f| %>

  <div class="field">
    <%= f.label :start_date %><br>
    <%= @reservation.start_date %><br>
  </div>
  <div class="field">
    <%= f.label :end_date %><br>
    <%= @reservation.end_date %><br>
  </div>
  <div class="field">
    <%= f.hidden_field :reservation_secure_token, value: @reservation.secure_token %><br>
  </div>
  <div class="field">
    <div id="dropin"></div>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>

<% end %>

<script type="text/javascript">
  function setupBT() {
    braintree.setup("<%= @client_token %>", 'dropin', {
      container: 'dropin'
    });
  }

  if (window.addEventListener)
    window.addEventListener("load", setupBT, false);
  else if (window.attachEvent)
    window.attachEvent("onload", setupBT);
  else window.onload = setupBT;

</script>

```

> Note:
>
> Notice that the javascript is inside the html file, not the assets. This is
> mainly because the payment javascript only specific to payment page, not all
> pages.
>
> <br>
> Also, take note that braintree also needs your generated client_token to build
> the gateway. Remember, your token is generated inside the controller action
> (payments#new).


<br><hr><br><br>
### 13) Test out the gateway
You can now test the payment gateway using some testing cards that can be found
in this link: https://developers.braintreepayments.com/reference/general/testing/ruby
.

<br><hr><br><br>

### 14) Tune your create action for payment
Paypal would use 'nounce' to indicate a transaction is made between you and Paypal.
You can use byebug to learn the return parameters before nouce, and after
processing the payment.

```
  def create
    nonce = params[:payment_method_nonce]

    # Something is wrong if nonce is absent
    render action: :new and return unless nonce

    # Process the payment between Paypal and You (Merchant)
    result = Braintree::Transaction.sale(
      amount: "10.00",
      payment_method_nonce: nonce
    )

    # reserve to save the transaction details into database

    redirect_to reservations_path
  end

```

> NOTE:
>
> Please fills in necessary information for Paypal, such as correct amount etc.
> This helps Paypal to document the transaction for your future references.
>
> <br>
> You'll be using the result variable to save information locally if needed.
> Usually you don't need to document full details because Braintree does
> offer some good payment dashboard except the payment_id.

<br><br>

### 15) Save the transaction details locally
Now that you have the gateway running, you can work on creating columns for
Payment model. Things like order_id, price, transaction_id can be documented
on your side. You can go ahead and create columns for it.

<br><hr><br><br>

### 16) Done. You're up and running for Sandbox.
All right, now you're done.

<br><hr><br><br>

## References
1. http://www.sitepoint.com/integrate-braintree-payments-rails/
2. https://developers.braintreepayments.com/guides/transactions/ruby
3. https://developers.braintreepayments.com/reference/general/testing/ruby
4. https://developers.braintreepayments.com/start/hello-server/ruby
