class CollaborationsController < ApplicationController
	def suscribe
		@collection = current_user.collections.find(params[:board_id])
		[params[:email1], params[:email2], params[:email3]].each do |email|
			if !email.empty?
				@user = User.find_by_email(email)
				if @user #achinga!
				else
					pass = ('a'..'z').to_a.shuffle[0..5].join
					#flash[:success] = email +', '+pass.to_s
					@user = User.create(email: email, password: pass,name: "")
					AppMailer.invite_email(email,current_user,pass).deliver
				end
				if @user
					@collection.collaborations.create(user_id: @user.id)
					flash[:success] = 'Invitations sent!'
				end
			end
		end
		redirect_to @collection
	end
end
