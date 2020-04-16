# frozen_string_literal: true

class AddTaxColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_gst, :decimal
    add_column :orders, :order_pst, :decimal
    add_column :orders, :order_hst, :decimal
  end
end
