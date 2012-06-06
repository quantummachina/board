class CollaborationsController < ApplicationController
	def suscribe
		[params[:email1], params[:email2], params[:email3]].each do |email|
			if !email.empty?
				pass = ('a'..'z').to_a.shuffle[0..5].join
				#flash[:success] = email +', '+pass.to_s
				User.create(email: email, password: pass)
				AppMailer
			end
		end
		redirect_to '/invite'
	end
end
