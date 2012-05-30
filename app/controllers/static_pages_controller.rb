class StaticPagesController < ApplicationController
	def login
	end

	def landing
		if signed_in?
		else
			@user = User.new
  		end
	end

end