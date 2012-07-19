namespace :db do
	desc "Items set"
	task set_items: :environment do 
		Item.all.each do |i|
			if i.urltype == 0
				i.set
			end
		end
	end
end