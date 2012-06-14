module CollectionsHelper

	def owner?
		@board.user.id == current_user.id
	end
	def collaborates?
		owner? || @board.collaborations.find_by_user_id(current_user.id)
	end
#CHANGE
def og_image(content,size)
		w=69*size + 12*(size-1)
		h=w*0.70
		if content.match(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i)
			auto_html(content){ html_escape; image}
				
		else
			auto_html(content){ html_escape; image; vimeo_og; youtube_og; behance_og_i; google_map(width: w, height: h); google_map(width: w, height: h); soundcloud_og; simple_format}
		end
	end
end
