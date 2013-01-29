class CfollowingsController < ApplicationController
	def create
		@collection = Collection.find(params[:collection])
		Cfollowing.create(user_id: current_user.id, cfollowed_id: @collection.id)

		#notification and email
		message = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> ha seguido tu proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
		@collection.user.notifications.create(message: message) #message to owner
		n = @collection.user.extra.notifications + 1
		@collection.user.extra.update_attributes(notifications: n)
		#if @collection.user.uoption.n_comments #email
			AppMailer.cfollow_notification_email(current_user, @collection).deliver
		#end

		redirect_to @collection
	end

	def destroy
		cf = Cfollowing.find(params[:id])
		@collection = Collection.find(cf.cfollowed_id)
		cf.destroy
		redirect_to @collection
	end
end
