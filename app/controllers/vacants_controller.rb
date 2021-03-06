# encoding: utf-8
class VacantsController < ApplicationController
  before_filter :signed_in_user

  def new
    redirect_to root_path
  end

  def create
    @vacant = Vacant.new(params[:vacant])
    if @vacant.save

      #notification to cfollowers
        message = '<a href="/users/' + @vacant.collection.user.id.to_s + '">' + @vacant.collection.user.name + '</a> ha publicado nueva colaboración en el proyecto <a href="/collections/' + @vacant.collection.id.to_s + '">' + @vacant.collection.title + '</a>'
        @vacant.collection.cfollowers.each do |u|
          u.notifications.create(message: message)
          n = u.extra.notifications + 1
          u.extra.update_attributes(notifications: n)
          if u.uoption.n_cfollowings
            AppMailer.gfollow_notification_email(u, @vacant.collection.user, @vacant.collection, 8).deliver
          end
        end

      if params.has_key?(:from) #comes from new collection
        redirect_to add_vacants_path({cid: @vacant.collection.id})
      else #comes from existing collection
        redirect_to @vacant.collection
      end
    else #refaactorize code
      flash[:error] = 'Los campos no pueden estar vacios.' 
      if params.has_key?(:from) #comes from new collection
        redirect_to add_vacants_path({cid: @vacant.collection.id})
      else #comes from existing collection
        redirect_to @vacant.collection
      end
    end


  end

  def destroy
    @vacant = Vacant.find(params[:id])
    @collection = @vacant.collection
    Request.find_all_by_vacant_id(@vacant.id).each do |r|
      r.update_attributes(vacant_id: 0)
    end
    @vacant.destroy
      redirect_to @collection
  end

  def edit
    @vacant = Vacant.find(params[:id])
    @board = @vacant.collection
  end

  def update
    @vacant = Vacant.find(params[:id])
    if @vacant.update_attributes(params[:vacant])
      flash[:success] = "Colaboración actualizada."
      redirect_to @vacant.collection
    else
      flash[:error] = 'Los campos no pueden estar vacíos' 
        render 'edit'
    end
  end

end
