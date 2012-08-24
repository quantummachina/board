class CommentsController < ApplicationController
	def create
		@collection = Collection.find(params[:comment][:collection_id])
		Comment.create(params[:comment])
		

		message = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> ha publicado un comentario en tu proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
		if @collection.user.id != current_user.id
			@collection.user.notifications.create(message: message)
			n = @collection.user.extra.notifications + 1
			@collection.user.extra.update_attributes(notifications: n)
		end

		@collection.collaborators.each do |u|
			if u.id != current_user.id
				u.notifications.create(message: message)
				n = u.extra.notifications + 1
				u.extra.update_attributes(notifications: n)
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
end
