class AddColumnToSchedule < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :saturday_start, :time
    add_column :schedules, :saturday_end, :time
    add_column :schedules, :sunday_start, :time
    add_column :schedules, :sunday_end, :time
  end
end
