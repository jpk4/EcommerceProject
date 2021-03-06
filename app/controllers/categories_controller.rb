# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :initialize_session
  before_action :load_cart
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
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
      @cart = Product.find(keys)
    end
  end
end
