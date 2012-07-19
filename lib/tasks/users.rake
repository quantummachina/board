namespace :db do
	desc "Users manipulation"
	task set_extras: :environment do 

		User.all.each do |u|
			if u.extra.nil?
				Extra.create(user_id: u.id)
			end
		end
	end
end