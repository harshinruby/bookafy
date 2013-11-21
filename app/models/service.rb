class Service < ActiveRecord::Base
  belongs_to :client
  belongs_to :category
  
  has_many :appointments
  # has_many :through associations
  has_many :allocations
  has_many :workers, through: :allocations

  #scope :id_client

  attr_accessor :new_category, :id_client

  before_create :create_category

  private 

  def create_category
  	self.category = Category.create!(name: new_category, client_id: id_client) if new_category.present?
  end	
end
