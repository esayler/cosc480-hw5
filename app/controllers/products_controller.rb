class ProductsController < ApplicationController
  include ProductsHelper
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

  def new
    @product = empty_product
  end

  def create
    if @product = Product.create(create_update_params)
      flash[:notice] = "New product #{@product.name} created successfully!"
      redirect_to products_path
    else
      flash[:warning] = "Error in creating product!"
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(create_update_params)
      flash[:notice] = "Product updated successfully!"
      redirect_to product_path(@product)
    else
      flash[:warning] = "Error: Product wasn't updated successfully!"
      redirect_to edit_product_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product #{@product.name} deleted successfully!"
    redirect_to products_path
  end

  private

  def create_update_params
    params.require(:product).permit(:name, :description, :price, :minimum_age_appropriate, :maximum_age_appropriate, :image)
  end
end
