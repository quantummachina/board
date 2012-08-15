class Externallink < ActiveRecord::Base
   attr_accessible :collection_id, :link

   belongs_to :collection
   
   validates :link, presence: true
end
