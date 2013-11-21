class CreateTeamLeaders < ActiveRecord::Migration
  def change
    create_table :team_leaders do |t|
      t.integer :number_of_workers
      t.belongs_to :client
      t.belongs_to :facebooker
      t.timestamps
    end
  end
end
