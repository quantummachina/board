module ApplicationHelper
	include AutoHtml
	#Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Funkalab"

			"#{base_title} | #{page_title}"
	end

		def embedded(content,size)
		w=58*size + 18*(size-1)
		h=w*0.71
		if content.match(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i)
			link_to content, target: "_blank" do
				auto_html(content){image}
			end
		else
		auto_html(content){ html_escape; image; vimeo(width: w, height: h); youtube_js_api(width: w, height: h); google_map(width: w, height: h); youtube(width: w, height: h); google_map(width: w, height: h) soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format}
		end
	end

	def logo
		image_tag("funkalab.png", alt: "Sample App", class: "round")
	end

end
