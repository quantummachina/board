namespace :db do
	desc "Users manipulation"
	task set_extras: :environment do 

		User.all.each do |u|
			Extra.create(user_id: u.id)
		end
	end
end