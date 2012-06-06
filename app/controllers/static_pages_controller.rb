class StaticPagesController < ApplicationController
	def about
	end

	def landing
		if signed_in?
			@boards = Collection.all
			render 'collections/index'
		else
			@user = User.new
  		end
	end

	def invite
		
	end

end