class State < ActiveRecord::Base
	attr_accessible :name

	has_many :cities, dependent: :destroy

end
