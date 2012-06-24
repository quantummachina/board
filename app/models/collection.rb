class Collection < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :category_id, :needs

  has_many :items, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :collaborators, through: :collaborations, source: :user

  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true

  default_scope order: 'collections.created_at DESC'
end
