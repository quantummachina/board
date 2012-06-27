namespace :db do
	desc "Fill up categories database"
	task set_categories: :environment do
		categories=["Other","Art", "Photography", "Painting", "Music", "Dance", "Film", "Illustration", "Theater", "Literature", "Sculpture", "Design", "Editorial", "Graphic Design", "Industrial Design", "Architecture", "Technology", "Videogames", "Hardware", "Software", "Games"]
		categories.each do |name|
			Category.create(name: name)
		end
	end
	task update_categories: :environment do 
		Category.create(name: 'Design') #missing category

		Collection.all.each do |c| #Re-categorize
			if (c.category_id!=2)&&(c.category_id!=5)&&(c.category_id!=7)&&(c.category_id!=17)
				c.update_attributes(category_id: 2)
			end
		end
		[3,4,6,8,9,11,14,15,16,18,21,10].each do |n|
			Category.find(n).delete
		end
	end
end