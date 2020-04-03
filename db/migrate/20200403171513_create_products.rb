class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.integer :sku
      t.integer :qty_on_hand
      t.decimal :current_price
      t.string :description
      t.string :image
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
