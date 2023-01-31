class ChangeColumnAppointments < ActiveRecord::Migration[7.0]
  def change
    change_column :appointments, :attended_by, :integer
    add_reference :appointments, :attended_by, foreign_key: { to_table: :users }
  end
end
