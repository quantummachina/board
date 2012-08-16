class Extra < ActiveRecord::Base
  attr_accessible :notifications, :user_id, :requests, :messages, :newboard

  belongs_to :user, dependent: :destroy
end
