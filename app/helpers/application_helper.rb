module ApplicationHelper
	include AutoHtml
	#Returns the full title on a per-page basis.
	def arr_4_cols(max, size) #this method can be more effective ordering by modulus??
		r=0 #row number
		arr=[] #array to be returned
		while r<(12/size)
			c=0 #counter
			a=[] #array inside arr
			i = c*(12/size)+r
			while i<max
				a<<i
				c=c+1
				i = c*(12/size)+r
			end
			arr<<a
			r=r+1
		end
		arr
	end

	def full_title(page_title)
		base_title = "Funkalab"

			"#{base_title} | #{page_title}"
	end

	def embedded(content,size)
		w=69*size + 12*(size-1)
		h=w*0.71
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
			link_to content[/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i], target: "_blank", class: "thumbnail" do
					auto_html(content){ html_escape; image; vimeo(width: w, height: h); youtube(width: w, height: h); google_map(width: w, height: h); google_map(width: w, height: h); soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format}
				end
		else
		auto_html(content){ html_escape; image(alt: "width=40"); vimeo(width: w, height: h); youtube(width: w, height: h); google_map(width: w, height: h); google_map(width: w, height: h); soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format}
		end
	end

	def logo
		image_tag("logofunk1.png", alt: "Sample App", class: "round")
	end

end
