class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :date ,null: false
      t.time :hour ,null: false
      t.string :reason ,null: false
      t.string :state
      t.string :attended_by
      t.references :user , null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
