class AttachmentsController < ApplicationController

	def create
		@collection = Collection.find(params[:collection_id])
		if !params[:attachment].nil? #no file to upload
			@attachment = current_user.attachments.build(params[:attachment])
			if @attachment.save
				@item = @collection.items.create(content: '*$&%#'+@attachment.id.to_s, kind: params[:kind], user_id: params[:user_id])
				@item.set
				if @item.kind == 1 && @collection.cover == 0
			      @collection.update_attributes(cover: @item.id)
			    end
				redirect_to @collection
			else
				redirect_to root_path
			end
		else
			redirect_to @collection
		end
	end

=begin Create for one post button, no tabs (add_item_b.html.erb)
	def create
		@collection = Collection.find(params[:collection_id])
    	if params[:attachment].nil? #no file to upload
    		if params[:content].empty? #empty post
	        	redirect_to @collection
	      	else #not file,but content
	        	@collection.items.create(content: params[:content])
	        	redirect_to @collection
	      	end
    	else# file to upload
			@attachment = current_user.attachments.build(params[:attachment])
			if @attachment.save
				@collection.items.create(content: '*$&%#'+@attachment.id.to_s)
				redirect_to @collection
			else
				redirect_to root_path
			end
		end
	end
=end
end
