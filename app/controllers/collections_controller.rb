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

end
