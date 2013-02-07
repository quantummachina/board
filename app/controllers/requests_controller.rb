# encoding: utf-8
class RequestsController < ApplicationController
  before_filter :signed_in_user
  #before_filter :correct_user, only: :destroy

	def invite
		if params.has_key?(:interlocutor_id)
			@user = User.find(params[:interlocutor_id])
		else
			@user = User.find_by_name(params[:name])
		end

		@collection = Collection.find(params[:collection_id])
		
		r = Request.create(user_id: @user.id, from_id: current_user.id, message: params[:message], collection_id: @collection.id, invite: true, vacant_id: 0)

		n = @user.extra.requests + 1
    	@user.extra.update_attributes(requests: n)
    	if @user.uoption.n_requests
			AppMailer.invite_notification_email(r).deliver
		end

		flash[:success] = 'Tu petición ha sido enviada. Te notificaremos si el usuario acepta colaborar en tu proyecto.'
		if params.has_key?(:interlocutor_id)
			redirect_to @user
		else
			redirect_to @collection
		end
				
	end

	def icanhelp
		@collection = Collection.find(params[:collection_id])
		r = Request.create(user_id: @collection.user.id, from_id: current_user.id, message: params[:message], collection_id: @collection.id, invite: false, vacant_id: params[:vacant_id])

		n = @collection.user.extra.requests + 1
    	@collection.user.extra.update_attributes(requests: n)

    	if @collection.user.uoption.n_requests
			AppMailer.help_notification_email(@collection.user, current_user, @collection, r).deliver
		end

		flash[:success] = 'Tu petición ha sido enviada. Te notificaremos si eres aceptado a colaborar. ¡Gracias!'
		redirect_to @collection
	end

	def index
		current_user.extra.update_attributes(requests: 0)
		@requests = current_user.requests
	end

	def destroy
		Request.find(params[:id]).delete
		redirect_to requests_path
	end

	def accept
		@request = Request.find(params[:id])
		@collection = @request.collection
		@fromuser= User.find(@request.from_id)
		
		if @request.invite
			@user = @request.user
			message = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> ha aceptado colaborar en tu proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
		else
			@user = User.find(@request.from_id)
			message = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> te ha aceptado a colaborar en su proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
		end


		@collaboration = @collection.collaborations.find_by_user_id(@user.id)
		
		if @collaboration.nil?
			@collection.collaborations.create(user_id: @user.id)
			#notification always goes to 'from' user
			@fromuser.notifications.create(message: message)
			n = @fromuser.extra.notifications + 1
			@fromuser.extra.update_attributes(notifications: n)

			AppMailer.accept_notification_email(@request).deliver

			#notification and email to ufollowers
			message = '<a href="/users/' + @user.id.to_s + '">' + @user.name + '</a> ha sido ha aceptado a colaborar en el proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
			@user.ufollowers.each do |u|
				u.notifications.create(message: message)
				n = u.extra.notifications + 1
				u.extra.update_attributes(notifications: n)
				if u.uoption.n_ufollowings
					AppMailer.gfollow_notification_email(u, @user, @collection, 3).deliver
				end
			end

			#notification to cfollowers
	  		message = '<a href="/users/' + @collection.user.id.to_s + '">' + @collection.user.name + '</a> ha agregado un nuevo colaborador al proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
	  		@collection.cfollowers.each do |u|
	  			u.notifications.create(message: message)
				n = u.extra.notifications + 1
				u.extra.update_attributes(notifications: n)
	  			if u.uoption.n_cfollowings
					AppMailer.gfollow_notification_email(u, @collection.user, @collection, 5).deliver
				end
	  		end

		end
		@request.delete
		flash[:success] = "La colaboración ha sido aceptada."
		redirect_to requests_path
	end
end
