# frozen_string_literal: true

ActiveAdmin.register Payment do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :card_number, :card_type, :billing_address, :expiry_month, :expiry_year, :cvv_code
  #
  # or
  #
  # permit_params do
  #   permitted = [:card_number, :card_type, :billing_address, :expiry_month, :expiry_year, :cvv_code]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
