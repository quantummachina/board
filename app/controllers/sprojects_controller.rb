class SprojectsController < ApplicationController

	def index
		if !current_user.admin
			redirect_to root_path
		end
		@sprojects = Sproject.all
	end

	def update
		@sproject = Sproject.find(params[:id])
		@sproject.update_attributes(text: params[:sproject][:text])
		redirect_to sprojects_path
	end

	def destroy
		Sproject.find(params[:id]).delete
		redirect_to sprojects_path
	end
end
