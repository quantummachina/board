class Uoption < ActiveRecord::Base
  attr_accessible :n_comments, :n_messages, :n_requests,  :user_id, :n_cfollowers, :n_ufollowers, :n_ufollowings, :n_cfollowings, :n_items, :temp_pay

  belongs_to :user, dependent: :destroy
end
