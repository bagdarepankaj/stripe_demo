class CartsController < ApplicationController
  def show
    @cart = session["cart"] || { "products" => [] }
  end

  def add
    @cart = session["cart"] || { "products" => [] }
    product = Product.find_by(id: params[:product_id])

    @cart["products"] << product

    respond_to do |format|
      format.html { redirect_to :cart }
    end
  end

  def remove
  end
end
