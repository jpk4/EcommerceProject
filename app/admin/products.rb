# frozen_string_literal: true

ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :product_id, :sku, :qty_on_hand, :current_price, :description, :image, :category_id, :name, :sales_price
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_id, :sku, :qty_on_hand, :current_price, :description, :image, :category_id, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
