class AddAppointmentTimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_start_time, :datetime
    add_column :appointments, :appointment_end_time, :datetime
  end
end
