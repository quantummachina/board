module ApplicationHelper
	include AutoHtml
	#Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Funkalab"

			"#{base_title} | #{page_title}"
	end

		def embedded(content,size)
		w=85*size
		h=w*0.71
		auto_html(content){ html_escape; image; vimeo(width: w, height: h); youtube(width: w, height: h); google_map(width: w, height: h); soundcloud(width: w, height: h); link target: "_blank", rel: "nofollow"; simple_format}
	end

end
