class Allocation < ActiveRecord::Base
	belongs_to :worker
  	belongs_to :service
end
