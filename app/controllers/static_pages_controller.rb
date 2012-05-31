class StaticPagesController < ApplicationController
	def login
	end

	def landing
		if signed_in?
			@boards = Collection.all
			render 'collections/index'
		else
			@user = User.new
  		end
	end

end