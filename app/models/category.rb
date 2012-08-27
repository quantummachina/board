class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :collections
  has_many :users
  has_many :subusers, class_name: 'User', foreign_key: 'subcategory_id'
end
