class Collection < ActiveRecord::Base
  attr_accessible :description, :title, :user_id

  has_many :items, dependent: :destroy

  belongs_to :user

  default_scope order: 'collections.created_at DESC'
end
