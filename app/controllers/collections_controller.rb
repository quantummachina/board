class CollectionsController < ApplicationController
	def index
		category = params[:category] || ""
		@categories = Category.all
		@size = 3 #boards size
		if category == ""
			@boards = Collection.all
			@users = User.all
		else
			@boards = Category.find(category).collections
			@users = Category.find(category).users
		end
		
	end

	def show
		@board = Collection.find(params[:id])
		@size = 3 #Items size
	end

	def create
		@collection = current_user.collections.build( params[:collection] )

	    if @collection.save
	      
	      flash[:success] = "Your board has been created! Invite friends to help you"
	      #redirect_to '/invte'
	      redirect_to @collection
	  	else
	  		flash[:error] = 'Title and description can not be blank' 
      		redirect_to root_path
	    end
	end

	def edit
		@collection = Collection.find(params[:id])
		@categories = Category.all
	end

	def update
		@collection = Collection.find(params[:id])
		if @collection.update_attributes(params[:collection])
	      flash[:success] = "Board updated"
	      redirect_to @collection
	    else
	      flash[:error] = 'Title and description can not be blank' 
	      render 'edit'
    	end
	end

	def destroy
    	Collection.find(params[:id]).destroy
    	redirect_to root_path
  	end
end
