class AddReferenceToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :branches, optional: true
  end
end
