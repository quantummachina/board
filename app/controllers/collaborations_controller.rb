class CollaborationsController < ApplicationController
	def suscribe
		@collection = current_user.collections.find(params[:board_id])
		[params[:email1], params[:email2], params[:email3]].each do |email|
			if !email.empty? && email != current_user.email
				@user = User.find_by_email(email)
				if @user
					@user.requests.create(from_id: current_user.id, collection_id: @collection.id, invite: true)
					n = @user.extra.requests + 1
    				@user.extra.update_attributes(requests: n)
				else
					Pendinguser.create(collection: @collection.id, email: email, from: current_user.id)
					AppMailer.invite_email(email, @collection.user, @collection, @collection.category).deliver
				end
				flash[:success] = 'Se ha invitado al usuario.'
			end
		end
		redirect_to @collection
	end


	def destroy
		@Collaboration = Collaboration.find(params[:id])
		@Collection = @Collaboration.collection
		@Collaboration.delete
		redirect_to @Collection
	end
end
