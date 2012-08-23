class NotificationsController < ApplicationController
	  before_filter :signed_in_user
	  
	def index
		current_user.extra.update_attributes(notifications: 0)
		@notifications = current_user.notifications
	end
end
