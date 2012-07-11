module ApplicationHelper
	include AutoHtml
	#Returns the full title on a per-page basis.

	def unread_mail
		if signed_in?
			current_user.extra.notifications
		else
			0
		end
=begin
		if signed_in?
			conversations = current_user.conversations + current_user.reverse_conversations
			um = 0
			for c in conversations do 
				if c.lines.first
					if c.lines.first.id
						if c.lines.first.user_id != current_user.id
							um=um+1
						end
					end
				end
			end
			um
		else
			0
		end
=end
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

end
