class ProductsController < ApplicationController
  def index
    if params[:sort_by] != nil
      @products = Product.sorted_by(params[:sort_by])
    else
      @products = Product.sorted_by("name")
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
