class AddColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :sub_category, :string
  end
end
