# frozen_string_literal: true

class ChangeSkuToString < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :sku, :string
  end
end
