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

	def logo
		image_tag("logofunk1.png", alt: "Sample App", class: "round")
	end

end
