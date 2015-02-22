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

  private

  def create_update_params
    params.require(:product).permit(:name, :description, :price, :minimum_age_appropriate, :maximum_age_appropriate, :image)
  end
end
