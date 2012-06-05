module ItemsHelper
	def isImage?(content)
		if content.match(/https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i)
			true
		end
	end
end
