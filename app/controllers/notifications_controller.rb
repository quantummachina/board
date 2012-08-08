class NotificationsController < ApplicationController
	def index
		current_user.extra.update_attributes(notifications: 0)
		@notifications = current_user.notifications
	end
end
