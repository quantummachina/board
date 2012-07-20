class SectionsController < ApplicationController
	def index
		if !current_user.admin
			redirect_to root_path
		end
		@sections = Section.all
	end
end
