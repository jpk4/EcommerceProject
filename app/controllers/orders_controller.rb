# frozen_string_literal: true

class OrdersController < ApplicationController
  def index; end

  def new
    if session[:cart].empty?
      @cart = []
    else
      keys = session[:cart].keys
      @cart = Product.find(keys)
    end
    @province = Province.find_by(code: 'MB')
  end
end
