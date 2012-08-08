class Collection < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :category_id, :needs, :status, :cover

  has_many :items, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :collaborators, through: :collaborations, source: :user
  has_many :vacants

  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true

  default_scope order: 'collections.promoted DESC'
end
