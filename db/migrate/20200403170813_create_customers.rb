class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.integer :customer_num
      t.string :name
      t.string :shipping_address
      t.string :province
      t.string :user_name
      t.string :password

      t.timestamps
    end
  end
end
