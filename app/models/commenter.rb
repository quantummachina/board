class Commenter < ActiveRecord::Base
	attr_accessible :user_id, :collection_id
	belongs_to :collection
  	belongs_to :user
end