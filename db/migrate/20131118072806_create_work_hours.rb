class CreateWorkHours < ActiveRecord::Migration
  def change
    create_table :work_hours do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.integer :role_id
      t.string :role_type
      t.timestamps
    end
  end
end
