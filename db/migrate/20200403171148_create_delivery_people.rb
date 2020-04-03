class CreateDeliveryPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_people do |t|
      t.integer :employee_id
      t.string :name
      t.datetime :delivery_date
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
