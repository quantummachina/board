# encoding: utf-8
namespace :data do
	desc "Categories"
	task change_categories: :environment do
		Category.find(5).update_attributes(name: 'Música')
		Category.find(17).update_attributes(name: 'Tecnología')
		Category.find(22).update_attributes(name: 'Diseño')
	end
end