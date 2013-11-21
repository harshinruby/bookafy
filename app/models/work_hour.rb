class WorkHour < ActiveRecord::Base
  belongs_to :client
  belongs_to :team_leader
  belongs_to :worker
end
