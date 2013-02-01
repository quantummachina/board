# encoding: utf-8
namespace :data do
	desc "Set items id"

	task set_items_id: :environment do
		Item.all.each do |i|
			if i.user_id == 0
				i.update_attributes(user_id: i.collection.user.id)
			end
		end
	end

	task clean_items: :environment do
		Item.all.each do |i|
			if i.collection.nil?
				i.destroy
			end
		end
	end

end