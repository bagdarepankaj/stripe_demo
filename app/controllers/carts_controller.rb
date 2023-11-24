class CartsController < ApplicationController
  before_action :set_cart
  before_action :find_product, only: [:add, :remove]

  def show
  end

  def add
    if @added_product
      @added_product["quantity"] += 1
    else
      @cart["products"] << @product
    end

    respond_to do |format|
      format.html { redirect_to :cart }
    end
  end

  def remove
    if @added_product["quantity"] == 1
      @cart["products"].delete(@product.as_json)
    else
      @added_product["quantity"] -= 1
    end

    respond_to do |format|
      format.html { redirect_to :cart }
    end
  end

  private

  def set_cart
    session["cart"] ||= { "products" => [] }
    @cart = session["cart"]
  end

  def find_product
    @product = Product.find_by(id: params[:product_id])
    @added_product = @cart["products"].find { |p| p["id"] == @product["id"] }
  end
end
