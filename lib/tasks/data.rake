# encoding: utf-8
namespace :data do
	desc "Ciudades"

	task pop_cities: :environment do
		ss = ['Aguascalientes','Baja California', 'Baja California Sur', 'Campeche', 'Coahuila de Zaragoza', 'Colima', 'Chiapas', 'Chihuahua', 'Distrito Federal', 'Durango', 'Guanajuato','Guerrero','Hidalgo','Jalisco','México','Michoacán de Ocampo','Morelos','Nayarit','Nuevo León','Oaxaca','Puebla','Querétaro','Quintana Roo','San Luis Potosí','Sinaloa','Sonora','Tabasco','Tamaulipas','Tlaxcala','Veracruz de Ignacio de la Llave','Yucatán', 'Zacatecas'  ]

		thefile = File.read('cities.csv')
		cities = thefile.split(/\n/)
		cities.each do |c|

			citie = c.split(',')
			edo = citie[0][1..citie[0].size-2]
			pob = citie[1][1..citie[1].size-2]

			ss.each do |s|
				if s == edo
					@s_id = ss.index(s) + 1
				end
			end

			City.create(state_id: @s_id, name: pob)
		end
	end

	task pop_states: :environment do
		ss = ['Aguascalientes','Baja California', 'Baja California Sur', 'Campeche', 'Coahuila de Zaragoza', 'Colima', 'Chiapas', 'Chihuahua', 'Distrito Federal', 'Durango', 'Guanajuato','Guerrero','Hidalgo','Jalisco','México','Michoacán de Ocampo','Morelos','Nayarit','Nuevo León','Oaxaca','Puebla','Querétaro','Quintana Roo','San Luis Potosí','Sinaloa','Sonora','Tabasco','Tamaulipas','Tlaxcala','Veracruz de Ignacio de la Llave','Yucatán', 'Zacatecas'  ]
		ss.each do |s|
			State.create(name: s)
		end
	end

	task migrate_cities: :environment do
		total = []
		total << [987,[340,1,286,31,4,323,311,291,279,281,18,174,199,37,184,89,100,98,105,110,124,6,133,162,47,172,15,87,88,90,92]] #Monterrey
		total << [16,[325,14]] #Tijuana
		total << [571,[7,142,94]] #Guadalajara
		total << [1804,[258,241,235,231]] #Canc[un] o benito ju[arez]
		total << [212,[254]] #chihuahua
		total << [764,[211]] #toluca
		total << [286,[178]] #durango
		total << [994,[177,13]] #sn pedro
		total << [266,[331,53,153,289,280,256,252,253,249,238,209,210,149,166,159,125,148]] #DF
		total.each do |t|
			cid = t[0]
			#puts City.find(cid).name
			t[1].each do |uid| 
				if t[0] == 266
					cid = (266..281).to_a.shuffle.first
					#puts City.find(cid).name
				end
				#puts "   " + uid.to_s
				User.find(uid).update_attributes(city_id: cid)
			end
		end
	end

	task migrate_users_categories: :environment do
		User.all.each do |u|
			case u.category_id
			when 2
				u.toggle!(:c_art)
			when 7
				u.toggle!(:c_video)
			when 5
				u.toggle!(:c_music)
			when 17
				u.toggle!(:c_tecnology)
			when 22
				u.toggle!(:c_design)
			end
			if u.category_id != u.subcategory_id
				case u.subcategory_id
				when 2
					u.toggle!(:c_art)
				when 7
					u.toggle!(:c_video)
				when 5
					u.toggle!(:c_music)
				when 17
					u.toggle!(:c_tecnology)
				when 22
					u.toggle!(:c_design)
				end
			else
				if u.category_id == 2
					u.toggle!(:c_art)
				end

		end
	end

	task deart: :environment do
		User.all.each do |u|
			if u.category_id == 2 && u.subcategory_id == 2
				u.toggle!(:c_art)
			end
		end
	end

	task fix_cities: :environment do
		City.all.each do |c|
			nn = c.name[0..c.name.size-2]
			c.update_attributes(name:nn)
		end
		City.find(1804).update_attributes(name: 'Cancún')
	end



end