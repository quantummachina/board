# encoding: utf-8
class CollectionsController < ApplicationController
	def index
		category = params[:category] || ""
		@categories = Category.all
		@size = 3 #boards size
		if category == ""
			@allboards = Collection.order('created_at DESC').where("promoted = ? AND status != 5", false)
			@promoboards = Collection.order('updated_at DESC').find_all_by_promoted(true)
		else
			@allboards = Category.find(category).collections.order('created_at DESC').where("promoted = ? AND status != 5", false)
			@promoboards = Category.find(category).collections.order('updated_at DESC').find_all_by_promoted(true)
		end
=begin
		if category == ""
			@allboards = Collection.reorder('created_at DESC').all
			@finishedboards = Collection.order('updated_at DESC').find_all_by_status(5)
			@promoboards = Collection.order('updated_at DESC').find_all_by_promoted(true)
		else
			@allboards = Category.find(category).collections.reorder('created_at DESC')
			@finishedboards = Category.find(category).collections.order('updated_at DESC').find_all_by_status(5)
			@promoboards = Category.find(category).collections.order('updated_at DESC').find_all_by_promoted(true)
		end
=end
		respond_to do |format|
	      format.html { }
	      format.js
	    end
	end

	def finished
		@finishedboards = Collection.order('created_at DESC').find_all_by_status(5)
	end

	def show
		@board = Collection.find(params[:id])
		@size = 6 #Items size
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
	    	if current_user.uoption.temp_pay == -1
	    		@collection.toggle!(:profitable)
	    		current_user.uoption.update_attributes(temp_pay: 0)
	    	end
	      flash[:success] = "Ahora crea las colaboraciones que necesites."

	      #mover más abajo: notification to ufollowers
	      	message = '<a href="/users/' + @collection.user.id.to_s + '">' + @collection.user.name + '</a> ha creado un nuevo proyecto: <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
  			@collection.user.ufollowers.each do |u|
  				u.notifications.create(message: message)
				n = u.extra.notifications + 1
				u.extra.update_attributes(notifications: n)
	  			if u.uoption.n_ufollowings
					AppMailer.gfollow_notification_email(u, @collection.user, @collection, 2).deliver
				end
	  		end

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
		if !signed_in?
			redirect_to root_path
		end
		@collection = Collection.new
		@categories = Category.all
		@states = State.all
		if params.has_key?(:state)
	      @state = params[:state].to_i
	    else
	      if @collection.city_id != 0
	        @state = @collection.city.state.id
	      else  
	        @state = 0
	      end
	    end

	    if @state == 0 
	      @cities = []
	    else
	      @cities = State.find(@state).cities
	    end
	    respond_to do |format|
	        format.html { }
	        format.js
	    end
	end

	def edit
		@collection = Collection.find(params[:id])
		if !((@collection.user.id == current_user.id) || (current_user.admin?))
      		redirect_to root_path
    	end
    	@categories = Category.all
		@els = @collection.externallinks
		@states = State.all

	    if params.has_key?(:state)
	      @state = params[:state].to_i
	    else
	      if @collection.city_id != 0
	        @state = @collection.city.state.id
	      else  
	        @state = 0
	      end
	    end
	    if @state == 0 
	      @cities = []
	    else
	      @cities = State.find(@state).cities
	    end

	    respond_to do |format|
	        format.html { }
	        format.js
	    end

	end

	def update
		@collection = Collection.find(params[:id])
		if @collection.update_attributes(params[:collection])
	    	if !params[:collection].has_key?(:city_id)
				@collection.update_attributes(city_id: 0)
			end
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

  	def quarantine
  		@c = Collection.find(params[:id])
  		@c.toggle!(:quarantine)
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

  		#notification to ufollowers
  		message = '<a href="/users/' + @collection.user.id.to_s + '">' + @collection.user.name + '</a> ha finalizado exitosamente el proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
  		@collection.user.ufollowers.each do |u|
  			u.notifications.create(message: message)
			n = u.extra.notifications + 1
			u.extra.update_attributes(notifications: n)
  			if u.uoption.n_ufollowings
				AppMailer.gfollow_notification_email(u, @collection.user, @collection, 1).deliver
			end
  		end

  		#notification to cfollowers
  		message = '<a href="/users/' + @collection.user.id.to_s + '">' + @collection.user.name + '</a> ha finalizado exitosamente el proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
  		@collection.cfollowers.each do |u|
  			u.notifications.create(message: message)
			n = u.extra.notifications + 1
			u.extra.update_attributes(notifications: n)
  			if u.uoption.n_cfollowings
				AppMailer.gfollow_notification_email(u, @collection.user, @collection, 7).deliver
			end
  		end

  		redirect_to edit_collection_path(@collection)
  	end

  	def eshare
  		collection = Collection.find(params[:board_id])
  		@name = "Alguien"
  		if signed_in? then @name = current_user.name end
  		message = params[:message]
  		email = params[:email]
  		if !email.empty? then AppMailer.share_email(email, collection, @name, message).deliver end
  		flash[:success] = 'Se ha enviado el correo electrónico.'
  		redirect_to collection
  	end

  	def statusupdate
  		@collection = Collection.find(params[:board_id])
  		@collection.update_attributes(statustext: params[:statustext])

  		#notification to cfollowers
  		message = '<a href="/users/' + @collection.user.id.to_s + '">' + @collection.user.name + '</a> ha actualizado el estatus del proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
  		@collection.cfollowers.each do |u|
  			u.notifications.create(message: message)
			n = u.extra.notifications + 1
			u.extra.update_attributes(notifications: n)
  			if u.uoption.n_cfollowings
				AppMailer.gfollow_notification_email(u, @collection.user, @collection, 4).deliver
			end
  		end

  		redirect_to @collection
  	end

  	def ideaupdate
  		@collection = Collection.find(params[:board_id])
  		@collection.update_attributes(idea: params[:idea])
  		redirect_to @collection
  	end
end
