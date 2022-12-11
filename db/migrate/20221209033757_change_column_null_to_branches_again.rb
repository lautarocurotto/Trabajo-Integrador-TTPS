class ChangeColumnNullToBranchesAgain < ActiveRecord::Migration[7.0]
  def change
    change_column :branches, :phone, :integer
  end
end
