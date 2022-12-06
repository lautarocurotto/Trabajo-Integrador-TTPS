class AddScheduleToBranch < ActiveRecord::Migration[7.0]
  def change
    add_reference :branches, :schedule, null: false, foreign_key: true
  end
end
