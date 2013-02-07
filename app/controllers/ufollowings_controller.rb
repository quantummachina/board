# encoding: utf-8
class UfollowingsController < ApplicationController
	def create
		@user = User.find(params[:user])
		Ufollowing.create(user_id: current_user.id, ufollowed_id: @user.id)

		#notification and email
		message = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> te está siguiendo ahora.'
		@user.notifications.create(message: message) #message to owner
		n = @user.extra.notifications + 1
		@user.extra.update_attributes(notifications: n)
		if @user.uoption.n_ufollowers #email
			AppMailer.ufollow_notification_email(current_user, @user).deliver
		end

		redirect_to @user
	end

	def destroy
		uf = Ufollowing.find(params[:id])
		@user = User.find(uf.ufollowed_id)
		uf.destroy
		redirect_to @user
	end
end
