# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'categories#index'

  resources 'products', only: %i[index show]
  resources 'categories', only: %i[index show]
  resources 'delivery_persons', only: %i[index]
  resources 'payments', only: %i[index]
  resources 'customers', only: %i[index]
  resources 'orders', only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
