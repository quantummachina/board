module MailHelper
	include AutoHtml
	
	def make_nice(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true)
        raw markdown.render(text)
	end



end
