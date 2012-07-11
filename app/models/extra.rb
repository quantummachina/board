class Extra < ActiveRecord::Base
  attr_accessible :notifications, :user_id

  belongs_to :user, dependent: :destroy
end
