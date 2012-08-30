class StaticPagesController < ApplicationController
	def secure
		if !current_user.admin
			redirect_to root_path
		end
		@fbuser = FbGraph::User.new(session[:fb_user_uid], :access_token => session[:fb_access_token]).fetch
		#@fbuser = FbGraph::User.new('egroj.sarertnoc').fetch
	end

	def about
	end

	def contact
		
	end

	def terms_of_service
	end

	def landing
		if signed_in?
			redirect_to collections_path
		else
			@user = User.new
			@sprojects = Sproject.all
			@s1 = Section.find_by_name('Landing front')
			@s2 = Section.find_by_name('Landing success')
			@s3 = Section.find_by_name('Landing weekly')
			@s4 = Section.find_by_name('Landing how')
			@s5 = Section.find_by_name('Landing why')
			@p_feat= Collection.find(Genvar.find_by_name('weekly').value)
  		end
	end

	def invite
		@board_id = params[:board_id]
	end

	def admin
		if !current_user.admin
			redirect_to root_path
		end
		p = HTTParty.get('http://hellokisses.com/')
		s = p.to_s
		@i = s[/http:\/\/imc1.hellokisses.com\/.+?\.(jpg|jpeg|bmp|gif|png)/]
	end

	def reset_password
			
	end
end