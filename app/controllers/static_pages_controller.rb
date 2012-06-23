class StaticPagesController < ApplicationController
	def secure
		if !current_user.admin
			redirect_to root_path
		end
		auth = request.env["omniauth.auth"]
		@fbu = FbGraph::User.new('me', access_token: 'AAAFG6Dl7V0gBAO1ZBTRthHl6Thbj1LH9ieWZB5i2bKm7fZBafyf439gmJP9Qh0lIiMZCrZCfaUtHnVcepuk7yJ8vtfybd1pSayXZA2ZA5O5BQZDZD').fetch #session[:fb_access_token]

	end

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