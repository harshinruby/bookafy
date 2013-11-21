include ApplicationHelper
class Client < ActiveRecord::Base
  
  #validate_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)
  
  has_one :user, as: :role, dependent: :destroy
  accepts_nested_attributes_for :user
  has_many :work_hours
  has_one :sub_domain
  has_many :team_leaders
  has_many :workers
  has_many :categories
  has_many :services
  has_many :appointments
  has_many :customers
  belongs_to :plan
  
  
end
