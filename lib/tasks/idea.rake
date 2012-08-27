namespace :data do
	desc "copy description as idea"
	task idea: :environment do
		Collection.all.each do |c|
			c.update_attributes(idea: c.description)
			c.update_attributes(description: '')
		end
	end
end