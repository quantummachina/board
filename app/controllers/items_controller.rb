# encoding: utf-8
class ItemsController < ApplicationController
  before_filter :signed_in_user

  def create
    @collection = Collection.find(params[:item][:collection_id])
    @item = @collection.items.create(content: params[:item][:content], kind: params[:kind])
    @item.set
    if @item.kind == 1 && @collection.cover == 0
      @collection.update_attributes(cover: @item.id)
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
