class Ufollowing < ActiveRecord::Base
  attr_accessible :ufollowed_id, :user_id

  belongs_to :user
  belongs_to :ufollowed, class_name: "User"
end
