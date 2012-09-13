class Collaboration < ActiveRecord::Base
  attr_accessible :collection_id, :user_id
  belongs_to :collection, touch: true
  belongs_to :user
end
