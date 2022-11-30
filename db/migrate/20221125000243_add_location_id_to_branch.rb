class AddLocationIdToBranch < ActiveRecord::Migration[7.0]
  def change
    add_reference :branches, :location, null: false, foreign_key: true
  end
end
