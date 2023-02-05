class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :branches, column: :branches_id
    add_foreign_key :branches, :locations
  end
end
