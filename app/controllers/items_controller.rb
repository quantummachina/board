class ItemsController < ApplicationController
  before_filter :signed_in_user

  def create
    
    @collection = Collection.find(params[:item][:collection_id])
    @item = @collection.items.create(content: params[:item][:content], kind: params[:item][:kind])
    @item.set

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
    @item.destroy
    respond_to do |format|
      format.html { redirect_to @collection }
      format.js
    end
  end

  def crosspost
    @original = Collection.find(params[:original_id])
    @collection = current_user.collections.find(params[:board_id])
    @item = @collection.items.create(content: params[:content])
    @item.set
      flash[:success] = "Item successfully posted in #{@collection.title}"
      redirect_to @original
  end
end
