class TeamLeader < ActiveRecord::Base
  has_one :user, as: :role, dependent: :destroy 
  has_one :user, as: :worktime, dependent: :destroy
  accepts_nested_attributes_for :user
  has_many :workers
  belongs_to :facebooker
  has_many :work_hours
  has_many :worktimes, as: :worktime
end
