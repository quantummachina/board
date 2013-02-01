# encoding: utf-8
class ItemsController < ApplicationController
  before_filter :signed_in_user

  def create
    @collection = Collection.find(params[:item][:collection_id])
    @item = @collection.items.create(content: params[:item][:content], kind: params[:kind], user_id: params[:user_id])
    @item.set
    if @item.kind == 1 && @collection.cover == 0 && (@item.urltype == 1 || @item.urltype == 2 || @item.urltype == 3)
      @collection.update_attributes(cover: @item.id)
    end

    #Notifications
    message = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> ha publicado en tu proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
    message2 = '<a href="/users/' + current_user.id.to_s + '">' + current_user.name + '</a> ha publicado en el proyecto <a href="/collections/' + @collection.id.to_s + '">' + @collection.title + '</a>'
    #if not owner
    if @collection.user.id != current_user.id
      @collection.user.notifications.create(message: message) #message to owner
      n = @collection.user.extra.notifications + 1
      @collection.user.extra.update_attributes(notifications: n)
      #if @collection.user.uoption.n_comments #email
        AppMailer.item_notification_email(@collection.user, @item).deliver
      #end
    end
    #to collaborators
    @collection.collaborators.each do |u|
      if u.id != current_user.id
        u.notifications.create(message: message2)
        n = u.extra.notifications + 1
        u.extra.update_attributes(notifications: n)
        #if u.uoption.n_comments
          AppMailer.item_notification_email(u, @item).deliver
        #end
      end
    end
    #to followers
    @collection.cfollowers.each do |u|
      if u.id != current_user.id && @collection.collaborators.where("user_id = ?", u.id).empty?
        u.notifications.create(message: message2)
        n = u.extra.notifications + 1
        u.extra.update_attributes(notifications: n)
        #if u.uoption.n_comments
          AppMailer.item_notification_email(u, @item).deliver
        #end
      end
    end


    respond_to do |format|
      format.html { redirect_to @collection }
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @collection = @item.collection
    if @item.content[0..4] == '*$&%#'
      att = Attachment.find(@item.content[5..(@item.content.length-1)].to_i)
      if att.user.id == current_user.id
        att.file = nil
        att.save
        att.destroy
      end
    end
    iid = @item.id
    @item.destroy
    if @collection.cover == iid
      if @collection.items.empty?
        @collection.update_attributes(cover: 0)
      else
        i = @collection.items.where('kind = ?',1).first
        if !i.nil?
          @collection.update_attributes(cover: i.id)
        else
          @collection.update_attributes(cover: 0)
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to @collection }
      format.js
    end
  end

  def crosspost #Deshuso
    @original = Collection.find(params[:original_id])
    @collection = current_user.collections.find(params[:board_id])
    @item = @collection.items.create(content: params[:content])
    @item.set
      flash[:success] = "Tu ítem ha sido enviado a #{@collection.title}"
      redirect_to @original
  end

  def setcover
    @collection = Item.find(params[:id]).collection
    @collection.update_attributes(cover: params[:id])
    redirect_to @collection
  end
end
