class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :collections
  has_many :users
end