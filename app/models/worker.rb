class Worker < ActiveRecord::Base
  has_one :user, as: :role, dependent: :destroy 
  accepts_nested_attributes_for :user
  belongs_to :client
  belongs_to :team_leader
  belongs_to :facebooker
  has_many :allocations
  has_many :services, through: :allocations
  has_many :work_hours
  has_many :appointments
  
end
