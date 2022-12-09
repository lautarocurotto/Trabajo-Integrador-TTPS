class ChangeColumnNullToLocations < ActiveRecord::Migration[7.0]
  def change
    change_column :locations, :name, :string, null: false
    change_column :locations, :province, :string, null: false
  end
end
