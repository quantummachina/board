# encoding: utf-8
namespace :data do
	desc "Opciones de Usuario"

	task pop_uoptions: :environment do
		User.all.each do |u|
			Uoption.create(user_id: u.id)
		end
	end



end