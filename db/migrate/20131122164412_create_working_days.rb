class CreateWorkingDays < ActiveRecord::Migration
  def change
    create_table :working_days do |t|
      t.string :day
      t.boolean :status
      t.datetime :start_time
      t.datetime :end_time
      t.integer :worktime_id
      t.string :worktime_type

      t.timestamps
    end
  end
end
