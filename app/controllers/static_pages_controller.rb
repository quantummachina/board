class StaticPagesController < ApplicationController
	def secure
		if !current_user.admin
			redirect_to root_path
		end
		@board = Collection.find(17) #84/17
	end

	def about
	end

	def terms_of_service
	end

	def landing
		if signed_in?
			redirect_to collections_path
		else
			@user = User.new
  		end
	end

	def invite
		@board_id = params[:board_id]
	end
end