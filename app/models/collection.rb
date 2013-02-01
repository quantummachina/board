class Collection < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :category_id, :needs, :status, :cover, :conclusion, :idea, :contribution, :city_id, :site, :statustext

  has_many :items, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  has_many :collaborators, through: :collaborations, source: :user
  has_many :commenters, dependent: :destroy
  has_many :acommenters, through: :commenters, source: :user
  has_many :vacants, dependent: :destroy
  has_many :externallinks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cfollowings, foreign_key: "cfollowed_id", dependent: :destroy
  has_many :cfollowers, through: :cfollowings, source: :user

  belongs_to :user
  belongs_to :category
  belongs_to :city

  validates :title, presence: true
  #validates :description, presence: true
  validates :idea, presence: true

  default_scope order: 'collections.promoted DESC'
end
