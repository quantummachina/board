module CollaborationsHelper
	def fb_invite_link(collection_id)
		'https://www.facebook.com/dialog/send?app_id=359438187452232&name=Join%20me%20on%20Funkalab!&link=http://www.funkalab.com&redirect_uri=http://www.funkalab.com/collections/'+ collection_id.to_s + '&picture=http://www.funkalab.com/assets/logofunk1.png&description='+ current_user.name + '%20is%20creating%20creative%20projects%20on%20Funkalab.%20Come%20collaborate%20with%20him.'
	end
end
