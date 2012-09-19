# encoding: utf-8
module ApplicationHelper
	include AutoHtml
	#Returns the full title on a per-page basis.

	def notifications
		if signed_in?
			n = current_user.extra.notifications
			if n > 0
				"(" + n.to_s + ")"
			end
		end
	end
	def messages
		if signed_in?
			n = current_user.extra.messages
			if n > 0
				"(" + n.to_s + ")"
			end
		end
	end
	def requests
		if signed_in?
			n = current_user.extra.requests
			if n > 0
				"(" + n.to_s + ")"
			end
		end
	end
	def news
		if signed_in?
			n = current_user.extra.notifications+current_user.extra.requests+current_user.extra.messages
			if n > 0
				"(" + n.to_s + ")"
			end
		end
	end
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
	def arr_2_cols(max, size) #this method can be more effective ordering by modulus??
		r=0 #row number
		arr=[] #array to be returned
		while r<(6/size)
			c=0 #counter
			a=[] #array inside arr
			i = c*(6/size)+r
			while i<max
				a<<i
				c=c+1
				i = c*(6/size)+r
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

	def categories
		Category.all
	end

	def make_nice(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true)
        raw markdown.render(text)
	end

	def wrapm(content, n)
	    sanitize(raw(content.split.map{ |s| wrap_long_string(s, n) }.join(' ')))
	end

	def tiempo(time)
		secs = Time.now().to_i - time.to_i
		if secs < 60
			'justo ahora'
		else
			mins = secs/60
			if mins < 60
				'hace ' + mins.to_s + ' minuto' + (mins > 1 ? 's' : '')
			else
				hrs = mins/60
				if hrs < 24
					'hace ' + hrs.to_s + ' hora' + (hrs > 1 ? 's' : '')
				else
					dys = hrs/24
					if dys < 30
						'hace ' + dys.to_s + ' día' + (dys > 1 ? 's' : '')
					else
						mths = dys/30
						if mths < 12
							'hace ' + mths.to_s + ' mes' + (mths > 1 ? 'es' : '' )
						else
							yrs = mths/12
							'hace ' + yrs.to_s + ' año' + (yrs > 1 ? 's' : '')
						end
					end
				end
			end			
		end

	end

end
