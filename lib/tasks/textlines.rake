namespace :data do
	desc "Fill up sections and landing textlines"
	task sections: :environment do
		categories=["front","success", "weekly", "how", "why"]
		categories.each do |name|
			Section.create(name: "Landing " + name)
		end
	end
	task landing_textlines: :environment do
=begin
		s1=["La comunidad para colaborar en tus proyectos de","Musica, Video, Arte, Diseno y Tecnologia", "Ahora en Monterrey!", "Conectate con Facebook", "Usa tu correo"]
		c=1
		s1.each do |t|
			Section.find(1).tls.create(t: t, i: c)
			c = c + 1
		end

		s2=["Proyectos Exitosos"]
		c=1
		s2.each do |t|
			Section.find(2).tls.create(t: t, i: c)
			c = c + 1
		end
=end
		s3=["Rodrigo y Bere estan buscando hacer el museo mas pequeno del mundo. En su proceso, documentaran como construirlo para que mas personas de la ciudad salgan a las calles y muestren una obra de un artista al publico. Estas interesado? unete y se parte del proyecto", "Ver mas."]
		c=2
		s3.each do |t|
			Section.find(3).tls.create(t: t, i: c)
			c = c + 1
		end

		s4=["Como funciona?","Comparte tu idea", "Si tienes una idea creativa, compartela y dinos que tipo de colaboracion necesitas.", "Conectate con creativos", "Una variedad de creativos podran encontrar tu proyecto y pedir colaborar contigo.", "Crea tu proyeto", "Ahora solo salgan y hagan lo que mas les gusta hacer!", "> Ver mas."]
		c=1
		s4.each do |t|
			Section.find(4).tls.create(t: t, i: c)
			c = c + 1
		end

		s5=["Por que usaria Funkalab?","Porque es lo unico que te falta para culminar tu proyecto creativo.", "en tu ciudad hay musicos, ilustradores, fotografos, disenadores y artistas dispuestos a colaborar y crear proyectos colectivamente. unete a Funkalab y desarrolla lo que verdaderamente te gusta."]
		c=1
		s5.each do |t|
			Section.find(5).tls.create(t: t, i: c)
			c = c + 1
		end
	end
end