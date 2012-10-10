class Uoption < ActiveRecord::Base
  attr_accessible :n_comments, :n_messages, :n_requests, :n_commenters,  :user_id

  belongs_to :user, dependent: :destroy
end
