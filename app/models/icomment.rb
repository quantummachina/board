class Icomment < ActiveRecord::Base
   attr_accessible :item_id, :user_id, :text

   belongs_to :item
   belongs_to :user
   validates :text, presence: true
   default_scope order: 'icomments.created_at DESC'
end
