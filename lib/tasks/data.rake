# encoding: utf-8
namespace :data do
	desc "Set acommenters"

	task set_acommenters: :environment do
		Comment.all.each do |c|
			if Commenter.where('user_id = ? AND collection_id = ?', c.user.id, c.collection.id).empty?
				Commenter.create(user_id: c.user.id, collection_id: c.collection.id)
			end
		end
	end

end