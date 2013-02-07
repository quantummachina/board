class CommentsController < ApplicationController
	def create
		@collection = Collection.find(params[:comment][:collection_id])
		comment = Comment.create(params[:comment])

		#Notificacion
		message = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> ha publicado un comentario en tu proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
		message2 = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> ha publicado un comentario en el proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
		#si no es el autor
		if @collection.user.id != current_user.id
			@collection.user.notifications.create(message: message) #mensaje a propietario
			n = @collection.user.extra.notifications + 1
			@collection.user.extra.update_attributes(notifications: n)
			if @collection.user.uoption.n_comments #email
				AppMailer.comment_notification_email(@collection.user, comment).deliver
			end
		end

		#to collaborators
		@collection.collaborators.each do |u|
			if u.id != current_user.id
				u.notifications.create(message: message)
				n = u.extra.notifications + 1
				u.extra.update_attributes(notifications: n)
				if u.uoption.n_comments
					AppMailer.comment_notification_email(u, comment).deliver
				end
			end
		end

		#to followers
		@collection.cfollowers.each do |u|
			if u.id != current_user.id && @collection.collaborators.where("user_id = ?", u.id).empty?
				u.notifications.create(message: message)
				n = u.extra.notifications + 1
				u.extra.update_attributes(notifications: n)
				if u.uoption.n_cfollowings
					AppMailer.comment_notification_email(u, comment).deliver
				end
			end
		end

		redirect_to @collection
	end

	def destroy
		comment = Comment.find(params[:id])
		@collection = comment.collection
		comment.destroy
		redirect_to @collection
	end

	def index
		if !current_user.admin
			redirect_to root_path
		end
		
	end
end
