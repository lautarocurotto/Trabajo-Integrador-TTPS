class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.time :monday_start
      t.time :monday_end
      t.time :tuesday_start
      t.time :tuesday_end
      t.time :wednesday_start
      t.time :wednesday_end
      t.time :thursday_start
      t.time :thursday_end
      t.time :friday_start
      t.time :friday_end

      t.timestamps
    end
  end
end
