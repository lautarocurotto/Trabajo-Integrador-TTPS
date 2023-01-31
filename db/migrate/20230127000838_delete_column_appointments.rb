class DeleteColumnAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :attended_by
  end
end
