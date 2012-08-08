class Notification < ActiveRecord::Base
  attr_accessible :message, :user_id, :link

  belongs_to :user

  default_scope order: 'notifications.created_at DESC'
end
