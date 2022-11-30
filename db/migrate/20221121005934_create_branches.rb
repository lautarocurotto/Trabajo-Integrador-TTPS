class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.belongs_to :location, index: true
      t.timestamps
    end
    add_index :branches, :name, unique: true
  end
end
