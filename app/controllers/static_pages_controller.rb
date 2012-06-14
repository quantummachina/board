class StaticPagesController < ApplicationController
	def about
	end

	def terms_of_service
	end

	def landing
		if signed_in?
			@boards = Collection.all
			@categories = Category.all
			render 'collections/index'
		else
			@user = User.new
  		end
	end

	def invite
		@board_id = params[:board_id]
	end

end