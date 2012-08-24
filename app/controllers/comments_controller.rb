class CommentsController < ApplicationController
	def create
		@collection = Collection.find(params[:comment][:collection_id])
		Comment.create(params[:comment])
		redirect_to @collection
	end

	def destroy
		comment = Comment.find(params[:id])
		@collection = comment.collection
		comment.destroy
		redirect_to @collection
	end
end
