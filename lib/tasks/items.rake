namespace :db do
	desc "Items set"
	task set_items: :environment do 

		Item.all.each do |i|
			i.set
		end
	end
end