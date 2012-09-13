class UoptionsController < ApplicationController
# encoding: utf-8
	def edit
		@uoption = Uoption.find(params[:id])
		if @uoption.user.id != current_user.id
			redirect_to root_path
		end
	end

	def update
		uoption = Uoption.find(params[:id])
		uoption.update_attributes(params[:uoption])
		flash[:success] = 'Se han actualizado tus preferencias'
		redirect_to current_user
	end
end
