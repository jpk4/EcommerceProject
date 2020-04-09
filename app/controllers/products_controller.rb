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
    if params[:search_id].empty?
      @products = Product.where('name LIKE ? OR description LIKE ?', "%#{params[:search_term]}%", "%#{params[:search_term]}%").page(params[:page])
    else
      @products = Product.where('(name LIKE ? OR description LIKE ?) AND products.category_id = ?', "%#{params[:search_term]}%", "%#{params[:search_term]}%", params[:search_id]).order(:name).page(params[:page])
      @category_name = Category.find(params[:search_id])
    end
  end

  def filter
    @products = if params[:filter_id] == '1'
                  Product.where.not(sales_price: nil).page(params[:page])
                else
                  Product.where(created_at: (Time.now.midnight - 3.day)..(Time.now.midnight + 1.day)).page(params[:page])
                end
  end
end
