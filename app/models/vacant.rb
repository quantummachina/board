class Vacant < ActiveRecord::Base
   attr_accessible :collection_id, :title, :description

   belongs_to :collection

  validates :title, presence: true
  validates :description, presence: true
  
   default_scope order: 'vacants.created_at DESC'
end
