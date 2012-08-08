class VacantsController < ApplicationController
  before_filter :signed_in_user

  def new
    redirect_to root_path
  end

  def create
    @vacant = Vacant.new(params[:vacant])
    if @vacant.save
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
    @vacant.destroy
      redirect_to @collection
  end

end
