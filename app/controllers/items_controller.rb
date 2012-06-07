class ItemsController < ApplicationController
  before_filter :signed_in_user

  def create
    @collection = Collection.find(params[:item][:collection_id])
    @collection.items.create(content: params[:item][:content])

    respond_to do |format|
      format.html { redirect_to @collection }
      format.js
    end
  end

  def destroy
    @collection = Item.find(params[:id]).collection
    Item.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to @collection }
      format.js
    end
  end

  def crosspost
    @original = Collection.find(params[:original_id])
    @collection = current_user.collections.find(params[:board_id])
      @collection.items.create(content: params[:content])
      flash[:success] = "Item successfully posted in #{@collection.title}"
      redirect_to @original
  end
end
