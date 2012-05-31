class CollectionsController < ApplicationController
	def index
		@boards = Collection.all
	end

	def show
		@board = Collection.find(params[:id])
		@size = 2
	end

	def crosspost
		@collection = current_user.collections.find(params[:board_id])
    	@collection.items.create(content: params[:content])
    	redirect_to @collection
	end

	def create
		@collection = current_user.collections.build( params[:collection] )

	    if @collection.save
	      
	      flash[:success] = "Your board has been created!"
	      redirect_to @collection
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
	      render 'edit'
    	end
	end

	def destroy
    	current_user.collections.find(params[:id]).destroy
    	redirect_to root_path
  	end
end
