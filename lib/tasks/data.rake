# encoding: utf-8
namespace :data do
	desc "Set thumbnails by setting all items"

	task set_thumbs: :environment do
		Item.all.each do |i|
			i.set
		end
	end



end