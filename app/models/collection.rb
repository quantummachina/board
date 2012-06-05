class Collection < ActiveRecord::Base
  attr_accessible :description, :title, :user_id

  has_many :items, dependent: :destroy

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  default_scope order: 'collections.created_at DESC'
end
