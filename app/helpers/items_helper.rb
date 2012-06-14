module ItemsHelper
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
					auto_html(content){ html_escape; image}
				end
		else
			if content.match(/(https?):\/\/(www.)?be(hance)?\.net\/gallery\/([A-Za-z0-9_-]*)\/([0-9])*/)
				#'behance'
				link_to content do
					auto_html(content){behance_og_t}
					auto_html(content){behance_og_i}
				end
			else
		auto_html(content){ html_escape; image; vimeo(width: w, height: h); youtube(width: w, height: h); google_map(width: w, height: h); google_map(width: w, height: h); soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format}
			end
		end
	end
	
	def isImage?(content)
		if content.match(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i)
			true
		end
	end

	def wrap(content)
		ini = content.index('llow">')
		if !ini.nil?
			nd = content.index('</a>')
			sub = content[(ini+6) .. (nd-1)]
 			repl = sanitize(raw(sub.split.map{ |s| wrap_long_string(s) }.join(' ')))
 			content.gsub!('llow">'+sub,'llow">'+repl)
 		end
		raw content
	end

private

   def wrap_long_string(text, max_width = 18)
     zero_width_space = "&#8203;"
     regex = /.{1,#{max_width}}/
     (text.length < max_width) ? text : 
                              text.scan(regex).join(zero_width_space)
   end
end
