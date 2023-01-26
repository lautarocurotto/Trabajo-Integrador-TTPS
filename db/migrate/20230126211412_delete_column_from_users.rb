class DeleteColumnFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :assignedbranch
  end
end
