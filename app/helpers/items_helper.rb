module ItemsHelper
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
