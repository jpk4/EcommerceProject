class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :card_number
      t.string :card_type
      t.string :billing_address
      t.integer :expiry_month
      t.integer :expiry_year
      t.integer :cvv_code

      t.timestamps
    end
  end
end
