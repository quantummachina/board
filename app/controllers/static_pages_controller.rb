# encoding: utf-8
class StaticPagesController < ApplicationController
	def secure
		if !signed_in? || !current_user.admin
			redirect_to root_path
		end
		@rs = Request.find_all_by_collection_id(199)
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

	def business
		@s = Section.find_by_name('Business')
	end

	def businessform
		name = params[:name]
		company = params[:company]
		email = params[:email]
		phone = params[:telephone]
		message = params[:message]
		subject = params[:sub]
		#AppMailer.business_email('windblows3@yahoo.com', subject, name, company,email,phone,message).deliver
		AppMailer.business_email('rodrigo@funkalab.com', subject, name, company,email,phone,message).deliver
		AppMailer.business_email('alberto@funkalab.com', subject, name, company,email,phone,message).deliver
		flash[:success] = "Gracias, hemos recibido tu información. Te buscaremos pronto. Eres genial."
		redirect_to '/business'
	end

	def invite
		@board_id = params[:board_id]
	end

	def reset_password
			
	end
end