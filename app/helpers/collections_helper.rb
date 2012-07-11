module CollectionsHelper

	def owner?
		if signed_in?
			@board.user.id == current_user.id
		else
			false
		end
	end
	def collaborates?
		if signed_in?
			owner? || @board.collaborations.find_by_user_id(current_user.id)
		else
			false
		end
	end
#CHANGE
def og_image(content,size)
		w=69*size + 12*(size-1)
		h=w*0.70
		if content[0..4] == '*$&%#' #attachment
			aid = content[5..(content.length-1)].to_i
			a = Attachment.find(aid)
			auto_html(a.file.url){ html_escape; image}
		else
			if content.match(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i)
				auto_html(content){ html_escape; image}
			else ##puede ser con un if preparativo de si regresa un html lo generalize
				auto_html(content){ html_escape; image; vimeo_og; youtube_og; behance_og_i; soundcloud_og; link target: "_blank", rel: "nofollow"; simple_format} # / ; google_map(width: w, height: h); google_map(width: w, height: h)
			end
			##Necesito corregir lograr el default_OG e implementar un de-link para poder implementar el wordwrap (wradp y luego de-linker)
		end
	end
end

def OG_or_link(content)
	ini = content.index('llow">') 
	if !ini.nil? #es link

		nd = content.index('</a>')
		sub = content[(ini+6) .. (nd-1)]

		if sub[0] == ('h' || 'H') #si comienza http
			r = auto_html(sub){default_og_i}
			if r != sub #si hubo imagen
				r
			else#regresa un-link
				repl = sanitize(raw(sub.split.map{ |s| wrap_long_string(s) }.join(' ')))
			end
		else #regresa www
			repl = sanitize(raw(sub.split.map{ |s| wrap_long_string(s) }.join(' ')))
		end

	else #no es link
		content
	end
end