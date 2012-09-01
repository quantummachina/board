class StaticPagesController < ApplicationController
	def secure
		if !current_user.admin
			redirect_to root_path
		end
		category = params[:category] || ""
		@categories = Category.all
		@size = 3 #boards size
		if category == ""
			@allboards = Collection.reorder('created_at DESC').all
			@finishedboards = Collection.order('updated_at DESC').find_all_by_status(5)
			@promoboards = Collection.order('updated_at DESC').find_all_by_promoted(true)
		else
			@allboards = Category.find(category).collections.reorder('created_at DESC')
			@finishedboards = Category.find(category).collections.order('updated_at DESC').find_all_by_status(5)
			@promoboards = Category.find(category).collections.order('updated_at DESC').find_all_by_promoted(true)
		end
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

	def reset_password
			
	end
end