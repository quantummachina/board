class CollectionsController < ApplicationController
	def index
		@boards = Collection.all
		@size = 3 #boards size
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
		@collection = current_user.collections.find(params[:id])
	end

	def update
		@collection = current_user.collections.find(params[:id])
		if @collection.update_attributes(params[:collection])
	      flash[:success] = "Board updated"
	      redirect_to @collection
	    else
	      flash[:error] = 'Title and description can not be blank' 
	      render 'edit'
    	end
	end

	def destroy
    	current_user.collections.find(params[:id]).destroy
    	redirect_to root_path
  	end
end
