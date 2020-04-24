# frozen_string_literal: true

class ProvincesController < ApplicationController
  def index
    @provinces = Province.all
  end

  def new
    @province = Province.find(3)
  end
end
