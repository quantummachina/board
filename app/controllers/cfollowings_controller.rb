class CfollowingsController < ApplicationController
	def create
		@collection = Collection.find(params[:collection])
		Cfollowing.create(user_id: current_user.id, cfollowed_id: @collection.id)
		redirect_to @collection
	end

	def destroy
		cf = Cfollowing.find(params[:id])
		@collection = Collection.find(cf.cfollowed_id)
		cf.destroy
		redirect_to @collection
	end
end
