# frozen_string_literal: true

class ChangeProvColumnToInt < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column :customers, :province, :integer
    end

    def down
      change_column :customers, :province, :string
    end
  end
end
