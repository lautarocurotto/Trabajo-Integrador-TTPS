class AddAssignedbranchToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :assignedbranch, :integer
  end
end
