namespace :db do
	desc "Fill up categories database"
	task set_categories: :environment do
		categories=["Other","Art", "Photography", "Painting", "Music", "Dance", "Film", "Illustration", "Theater", "Literature", "Sculpture", "Design", "Editorial", "Graphic Design", "Industrial Design", "Architecture", "Technology", "Videogames", "Hardware", "Software", "Games"]
		categories.each do |name|
			Category.create(name: name)
		end
	end
end