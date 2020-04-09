# frozen_string_literal: true

class AddSalesPriceColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :sales_price, :decimal
  end
end
