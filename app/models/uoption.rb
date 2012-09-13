class Uoption < ActiveRecord::Base
  attr_accessible :n_comments, :n_messages, :n_requests, :user_id

  belongs_to :user, dependent: :destroy
end
