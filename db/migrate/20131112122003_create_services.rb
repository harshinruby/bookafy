class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service_name
      t.integer :price
      t.string :description
      t.belongs_to :client
	  t.timestamps
    end
  end
end
