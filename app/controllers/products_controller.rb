class ProductsController < ApplicationController
  def index
    if params[:sort] != nil
      @products = Product.sorted_by(params[:sort])
    else
      @products = Product.sorted_by("name")
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
