class Category < ActiveRecord::Base
  belongs_to :client
  has_many :services, dependent: :destroy
  has_many :appointments
  accepts_nested_attributes_for :services
end
