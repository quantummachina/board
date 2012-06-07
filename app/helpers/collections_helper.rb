module CollectionsHelper

	def owner?
		@board.user.id == current_user.id
	end
	def collaborates?
		owner? || @board.collaborations.find_by_user_id(current_user.id)
	end

end
