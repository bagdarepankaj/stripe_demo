class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      format.html {
        if @product.save
          redirect_to products_path, notice: 'Sucessfully created!'
        else
          redirect_to products_path, error: 'An Error occured while completing the transcation'
        end
      }
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    respond_to do |format|
      format.html {
        if @product.update(product_params)
          redirect_to products_path, notice: 'Sucessfully Updated!'
        else
          redirect_to products_path, error: 'An Error occured while Updating'
        end
      }
    end
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
