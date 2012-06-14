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
=begin
			m = FastImage.size(content)
			if m[0] > m[1]
				link_to content, target: "_blank", class: "thumbnail" do
					auto_html(content){ html_escape; image; vimeo(width: w, height: h); youtube(width: w, height: h); google_map(width: w, height: h); google_map(width: w, height: h); soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format}
				end
			else
				link_to content, target: "_blank", class: "thumbnail" do
					#image_tag content, width: 124*((m[0]*1.0)/(m[1]*1.0))
					auto_html(content){ html_escape; image; vimeo(width: w, height: h); youtube(width: w, height: h); google_map(width: w, height: h); google_map(width: w, height: h); soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format}
				end
			end
=end
				
					auto_html(content){ html_escape; image}
				
		else
		auto_html(content){ html_escape; image; vimeo_og; youtube(width: w, height: h); google_map(width: w, height: h); google_map(width: w, height: h); soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format}
		end
	end
end
