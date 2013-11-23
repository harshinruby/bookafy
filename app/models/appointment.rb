class Appointment < ActiveRecord::Base
	belongs_to :client
	belongs_to :worker
	belongs_to :category
	belongs_to :service
	belongs_to :customer 

	has_one :booker, :class_name => 'Customer', :foreign_key => :booker_id
	accepts_nested_attributes_for :customer

end
