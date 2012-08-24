class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :collection_id
  belongs_to :collection
  belongs_to :user

  validates :text, presence: true

  default_scope order: 'comments.created_at DESC'
end
