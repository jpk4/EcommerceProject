# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'categories#index'

  resources 'products', only: %i[index show]
  resources 'categories', only: %i[index show]
  resources 'delivery_persons', only: %i[index]
  resources 'payments', only: %i[index]
  resources 'customers', only: %i[index]
  resources 'orders', only: %i[index new]

  get 'pages/show'
  get 'search', to: 'products#search', as: 'search'
  get 'filter', to: 'products#filter', as: 'filter'
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'

  get ':permalink', to: 'pages#permalink', as: 'permalink'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
