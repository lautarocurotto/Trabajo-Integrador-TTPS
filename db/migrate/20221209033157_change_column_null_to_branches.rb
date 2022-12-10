class ChangeColumnNullToBranches < ActiveRecord::Migration[7.0]
  def change
    change_column :branches, :name, :string, null: false, unique: true
    change_column :branches, :address, :string, null: false
    change_column :branches, :phone, :string, null: false
    change_column :branches, :location_id, :string, null: false
  end
end
