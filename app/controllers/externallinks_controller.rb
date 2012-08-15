# encoding: utf-8
class ExternallinksController < ApplicationController

	def create
		@externallink=Externallink.create(params[:externallink])
		@collection = @externallink.collection
		@els = @externallink.collection.externallinks
		respond_to do |format|
	      format.html { redirect_to edit_collection_path(@externallink.collection) }
	      format.js
	    end
		
	end

	def destroy
		@el = Externallink.find(params[:id])
		@collection = @el.collection
		@el.destroy
		@els = @collection.externallinks
		respond_to do |format|
	      format.html { redirect_to edit_collection_path(@collection) }
	      format.js
	    end
	end
end
