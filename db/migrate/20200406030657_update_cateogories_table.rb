# frozen_string_literal: true

class UpdateCateogoriesTable < ActiveRecord::Migration[6.0]
  def change
    add_reference(:categories, :parent_category, index: true)
  end
end
