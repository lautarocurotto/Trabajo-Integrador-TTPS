class AddIndexToLocation < ActiveRecord::Migration[7.0]
  def change
    add_index :locations, [:name, :province], unique: true
  end
end
