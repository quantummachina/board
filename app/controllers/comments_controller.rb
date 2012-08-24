class CommentsController < ApplicationController
	def create
		@collection = Collection.find(params[:comment][:collection_id])
		Comment.create(params[:comment])
		redirect_to @collection
	end
end
