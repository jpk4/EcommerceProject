# frozen_string_literal: true

class DropSubCategoryColumnFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :sub_category
  end
end
