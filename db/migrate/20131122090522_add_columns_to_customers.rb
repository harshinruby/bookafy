class AddColumnsToCustomers < ActiveRecord::Migration
  def change
  add_column :customers, :category_id, :integer
  add_column :customers, :service_id, :integer
  add_column :customers, :worker_id, :integer
  end
end
