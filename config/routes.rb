Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  get 'categories/index'
  get 'delivery_persons/index'
  get 'payments/index'
  get 'customers/index'
  get 'orders/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
