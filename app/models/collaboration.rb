class Collaboration < ActiveRecord::Base
  attr_accessible :collection_id, :user_id
  belongs_to :collection
  belongs_to :user
end
