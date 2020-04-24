# frozen_string_literal: true

class PagesController < ApplicationController
  def show; end

  def permalink
    @page = Page.find_by(permalink: params[:permalink])
    if session[:cart].empty?
      @cart = []
    else
      keys = session[:cart].keys
      @cart = Product.find(keys)
    end
    redirect_to root_path if @page.nil?
  end
end
