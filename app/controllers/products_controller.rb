# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order(:name).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
  end

  def search
    @products = Product.where('name LIKE ? OR description LIKE ?', "%#{params[:search_term]}%", "%#{params[:search_term]}%").page(params[:page])
  end
end
