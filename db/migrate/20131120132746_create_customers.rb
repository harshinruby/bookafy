class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :dob
      t.string :mobile
      t.string :email
      t.belongs_to :client
      t.integer :booker_id

      t.timestamps
    end
  end
end
