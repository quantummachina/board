class UfollowingsController < ApplicationController
	def create
		@user = User.find(params[:user])
		Ufollowing.create(user_id: current_user.id, ufollowed_id: @user.id)
		redirect_to @user
	end

	def destroy
		uf = Ufollowing.find(params[:id])
		@user = User.find(uf.ufollowed_id)
		uf.destroy
		redirect_to @user
	end
end
