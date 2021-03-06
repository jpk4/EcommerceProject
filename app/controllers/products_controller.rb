# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart

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

  def add_to_cart
    id = params[:id]
    @qty = 1
    # session[:cart] << id unless session[:cart].include?(id)
    if session[:cart].empty?
      session[:cart] = { id => @qty } unless session[:cart].include?(id)
    else
      session[:cart][id] = @qty unless session[:cart].include?(id)
    end
    redirect_to request.referrer
  end

  def remove_from_cart
    id = params[:id]
    session[:cart].delete(id)
    redirect_to request.referrer
  end

  def add_quantity
    id = params[:id]
    @qty = session[:cart][id].to_i + 1
    new_hash = { id => @qty }
    session[:cart].merge!(new_hash)
    redirect_to request.referrer
  end

  def remove_quantity
    id = params[:id]
    @qty = session[:cart][id].to_i - 1
    new_hash = { id => @qty }
    session[:cart].merge!(new_hash)
    redirect_to request.referrer
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def load_cart
    if session[:cart].empty?
      @cart = []
    else
      keys = session[:cart].keys
      keys.map(&:to_i)
      @cart = Product.find(keys)
    end
  end
end
