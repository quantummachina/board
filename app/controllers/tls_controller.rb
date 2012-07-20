class TlsController < ApplicationController
	def update
		Tl.find(params[:id]).update_attributes(params[:tl])
		redirect_to sections_path
	end
end
