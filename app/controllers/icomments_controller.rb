class IcommentsController < ApplicationController
	def create
		@collection = Item.find(params[:icomment][:item_id]).collection
		icomment = Icomment.create(params[:icomment])

		#Notification
		message = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> ha publicado un comentario en el proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
		#if not owner
		if @collection.user.id != current_user.id
			@collection.user.notifications.create(message: message) #notification to owner
			n = @collection.user.extra.notifications + 1
			@collection.user.extra.update_attributes(notifications: n)
			#if @collection.user.uoption.n_comments #email
			#	AppMailer.comment_notification_email(@collection.user, comment).deliver
			#end
		end

		#to collaborators
		@collection.collaborators.each do |u|
			if u.id != current_user.id
				u.notifications.create(message: message)
				n = u.extra.notifications + 1
				u.extra.update_attributes(notifications: n)
		#		if u.uoption.n_comments
		#			AppMailer.comment_notification_email(u, comment).deliver
		#		end
			end
		end

		#to followers
		#@collection.cfollowers.each do |u|
		#	if u.id != current_user.id && @collection.collaborators.where("user_id = ?", u.id).empty?
		#		u.notifications.create(message: message)
		#		n = u.extra.notifications + 1
		#		u.extra.update_attributes(notifications: n)
		#		if u.uoption.n_cfollowings
		#			AppMailer.comment_notification_email(u, comment).deliver
		#		end
		#	end
		#end


		redirect_to @collection
	end
	def destroy
		icomment = Icomment.find(params[:id])
		@collection = icomment.item.collection
		icomment.destroy
		redirect_to @collection
	end

end
