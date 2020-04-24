# frozen_string_literal: true

ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :order_num, :order_date, :customer_id, :payment_id, :order_gst, :order_pst, :order_hst
  #
  # or
  #
  # permit_params do
  #   permitted = [:order_num, :order_date, :customer_id, :payment_id, :order_gst, :order_pst, :order_hst]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
