class PaymentsController < ApplicationController

  def new
    products = get_products_and_line_items
    # product = Stripe::Product.create({name: 'T-shirt'})
    @stripe_session = Stripe::Checkout::Session.create({
      ui_mode: 'embedded',
      line_items: products,
      mode: 'payment',
      return_url:  'http://localhost:3000'+ "/payments/return?session_id=#{session.id}",
    })
    # render json: { clientSecret: stripe_session.client_secret }.to_json
    @clientSecret = @stripe_session.client_secret
  end

  def return
  end

  def session_status
    session = Stripe::Checkout::Session.retrieve(params[:session_id])

    render json: {status: session.status, customer_email:  session.customer_details.email}.to_json
  end

  private
  
  def get_products_and_line_items
    params[:products].map do |product|
      if product["prod_id"] || product["price_id"]
        prod = Stripe::Product.retrieve(product["prod_id"])
        { price: prod["default_price"], quantity: product["quantity"] }
      else
        product
      end
    end
  end
end