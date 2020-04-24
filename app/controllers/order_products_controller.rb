# frozen_string_literal: true

class OrderProductsController < ApplicationController
  def show; end

  def new
    if session[:cart].empty?
      @cart = []
    else
      keys = session[:cart].keys
      @cart = Product.find(keys)
    end
    @province = Province.find_by(code: 'MB')
  end

  def tax
    @province = Province.find(params[:province_id])
    if session[:cart].empty?
      @cart = []
    else
      keys = session[:cart].keys
      @cart = Product.find(keys)
    end
  end
end
