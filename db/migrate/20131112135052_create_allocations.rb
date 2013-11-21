class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.belongs_to :service
      t.belongs_to :worker
      t.timestamps
    end
  end
end
