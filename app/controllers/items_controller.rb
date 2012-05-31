class ItemsController < ApplicationController
  before_filter :signed_in_user

  def create
    @collection = current_user.collections.find(params[:item][:collection_id])
    @collection.items.create(content: params[:item][:content])

    respond_to do |format|
      format.html { redirect_to @collection }
      format.js
    end
  end

  def destroy
    @project = Resource.find(params[:id]).project
    Resource.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def crosspost
    @project = Project.find(params[:project_id])
    @project.resources.create(content: params[:content])
    redirect_to @project
  end
end
