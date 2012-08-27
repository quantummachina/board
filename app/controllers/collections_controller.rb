# encoding: utf-8
class CollectionsController < ApplicationController
	def index
		category = params[:category] || ""
		@categories = Category.all
		@size = 3 #boards size
		if category == ""
			@boards = Collection.order('created_at DESC').all
			@users = User.all
		else
			@boards = Category.find(category).collections.order('created_at DESC')
			@users = Category.find(category).users
		end
		respond_to do |format|
	      format.html { }
	      format.js
	    end
	end

	def show
		@board = Collection.find(params[:id])
		@size = 3 #Items size
		@names = User.find(:all,:select=>'name').map(&:name)
		respond_to do |format|
	      format.html { }
	      format.js
	    end
	end

	def create
		@collection = current_user.collections.build( params[:collection] )

	    if @collection.save
	    	@collection.user.extra.toggle!(:newboard)
	      flash[:success] = "Ahora crea las colaboraciones que necesites."
	      redirect_to add_vacants_path({cid: @collection.id})

	  	else
	  		flash[:error] = 'Título y descripción no pueden estar vacios' 
      		redirect_to action: 'new'
	    end
	end
	def add_vacants
		@collection = Collection.find(params[:cid])
	end
	def devacant 
		@vacant = Vacant.find(params[:id])
		id = @vacant.collection.id
		@vacant.delete
		redirect_to add_vacants_path({cid: id})
	end

	def new
		@collection = Collection.new
		@categories = Category.all
	end



	def edit
		@collection = Collection.find(params[:id])
		@categories = Category.all
		@els = @collection.externallinks
	end

	def update
		@collection = Collection.find(params[:id])
		if @collection.update_attributes(params[:collection])
			if @collection.status !=5
	      		flash[:success] = "Proyecto actualizado."
	      		redirect_to @collection
	      	else
				redirect_to edit_collection_path(@collection)
	      	end
	    else
	      flash[:error] = 'Los campos  no pueden estar vacíos' 
	      render 'edit'
    	end
	end

	def destroy
    	Collection.find(params[:id]).destroy
    	redirect_to root_path
  	end

  	def promote
  		@c = Collection.find(params[:id])
  		@c.toggle!(:promoted)
  		redirect_to @c
  	end

  	def successful
  		Sproject.create(collection_id: params[:collection_id])
  		redirect_to sprojects_path
  	end

  	def weekly
  		Genvar.find_by_name('weekly').update_attributes(value: params[:id])
  		redirect_to root_path
  	end

  	def switchstat
  		@collection = Collection.find(params[:id])
  		s = @collection.status
  		if s == 0 then r = 1 else r = 0 end
  		@collection.update_attributes(status: r)
  		redirect_to @collection
  	end

  	def markfinished
  		@collection = Collection.find(params[:id])
  		@collection.update_attributes(status: 5)
  		redirect_to edit_collection_path(@collection)
  	end
end
