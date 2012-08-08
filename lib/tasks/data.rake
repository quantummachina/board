namespace :data do
	desc "seting to covers"
	task set_covers: :environment do

		Collection.all.each do |c|
			i = c.items.where(kind: 1).first
			if !i.nil?
				c.cover = i.id
				c.save
			end
		end

	end
end