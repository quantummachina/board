class Sproject < ActiveRecord::Base
  attr_accessible :collection_id, :text

  belongs_to :collection
end
