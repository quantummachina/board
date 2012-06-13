namespace :db do
	desc "Fill up categories database"
	task set_categories: :environment do
		categories=["Other","Art", "Photography", "Painting", "Music", "Dance", "Film", "Illustration", "Theater", "Literature", "Sculpture", "Design", "Editorial", "Graphic Design", "Industrial Design", "Architecture", "Technology", "Videogames", "Hardware", "Software", "Games"]
		categories.each do |name|
			Category.create(name: name)
		end
	end
	task update_categories: :environment do
		Collection.all.each do |c|
			if (c.category_id==1)||(c.category_id==12)||(c.category_id==13)||(c.category_id==19)||(c.category_id==20)
				c.update_attributes(category_id: 2)
			end
		end
		[1,12,13,19,20].each do |n|
			Category.find(n).delete
		end
	end
end