class Cfollowing < ActiveRecord::Base
  attr_accessible :cfollowed_id, :user_id

  belongs_to :user
  belongs_to :cfollowed, class_name: "Collection"
end
