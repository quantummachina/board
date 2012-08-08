class Extra < ActiveRecord::Base
  attr_accessible :notifications, :user_id, :requests, :messages

  belongs_to :user, dependent: :destroy
end
