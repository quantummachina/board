module CollaborationsHelper
	def fb_invite_link(collection_id)
		'https://www.facebook.com/dialog/send?app_id=359438187452232&name=Join%20me%20on%20Funkalab!&link=http://www.funkalab.com&redirect_uri=http://www.funkalab.com/collections/'+ collection_id.to_s + '&picture=http://www.funkalab.com/assets/logofunk1.png&description='+ current_user.name + '%20is%20developing%20a%20creative%20project%20on%20Funkalab.%20Come%20collaborate%20with%20him!'
	end
	def fb_share_project
		'https://www.facebook.com/dialog/feed?app_id=359438187452232&link=http://www.funkalab.com/collections/' + @board.id.to_s + '&picture=http://www.funkalab.com/assets/logofunk1.png&name=Funkalab&caption='+ current_user.name.split.join('%20') + '%20recomends%20this%20creative%20project!&
  description=' + 'Come check out this project in Funkalab, an open platform for creatives. '.split.join('%20') + '&
  redirect_uri=http://www.funkalab.com/collections/' + @board.id.to_s
	end
  
end
