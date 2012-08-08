module CollaborationsHelper
	def fb_invite_link(collection_id)
		'https://www.facebook.com/dialog/send?app_id=359438187452232&name=Uneteme%20en%20Funkalab!&link=http://www.funkalab.com&redirect_uri=http://www.funkalab.com/collections/'+ collection_id.to_s + '&picture=http://www.funkalab.com/assets/logofunk1.png&description='+ current_user.name + '%20esta%20desarrollando%20un%20proyecto%20creativo%20en%20Funkalab.%20Ven%20a%20ayudarle!'
	end
	def fb_share_project
		'https://www.facebook.com/dialog/feed?app_id=359438187452232&link=http://www.funkalab.com/collections/' + @board.id.to_s + '&picture=http://www.funkalab.com/assets/logofunk1.png&name=Funkalab&caption=' + (if signed_in? then current_user.name.split.join('%20') else '' end) + '%20recomienda%20"' + @board.title.split.join('%20') + '",%20proyecto%20de%20' + @board.category.name + '&description=' + 'Funkalab%20es%20la%20comunidad%20para%20desarrollar%20tus%20proyectos%20creativos.' + '&redirect_uri=http://www.funkalab.com/collections/' + @board.id.to_s
	end
  
end
