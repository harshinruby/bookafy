class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :business_name
      t.string :business_type
      t.string :business_address
      t.belongs_to :plan  
      t.timestamps
    end
  end
end
