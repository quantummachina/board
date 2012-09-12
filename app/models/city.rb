class City < ActiveRecord::Base
	attr_accessible :state_id, :name
	
	belongs_to :state

end
