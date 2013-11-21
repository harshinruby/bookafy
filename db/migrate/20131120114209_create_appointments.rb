class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      
      t.belongs_to :client
      t.belongs_to :worker
      t.belongs_to :category
      t.belongs_to :service
      t.belongs_to :customer
      t.timestamps
    end
  end
end
