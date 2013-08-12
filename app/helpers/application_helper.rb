module ApplicationHelper
	
	def title
		base_title = "Diplomacy"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def set_color(color)
		cookies.permanent[:remember_color] = color
	end
	
	def default_color
		if cookies[:remember_color].empty?
			cookies.permanent[:remember_color] = '#45B8FF'
		end
	end
		
	def title_color 
		unless cookies[:remember_color]
			return '#45B8FF'
		else
			return cookies[:remember_color]
		end
	end 
	
	def regions
		regions = ['bohemia', 'budapest', 'galicia', 'triest', 'tyrolia', 'vienna', 'clyde', 'edinburgh', 'liverpool', 'london', 
									'wales', 'yorkshire', 'brest', 'burgundy', 'gascony', 'marseilles', 'paris', 'picardy', 'berlin', 'kiel', 
									'munich', 'prussia', 'ruhr', 'silesia', 'apulia', 'naples', 'piedmont', 'rome', 'tuscany', 'venice', 'livonia',
									'moscow', 'sevastopol', 'st. petersburg', 'ukraine', 'warsaw', 'ankara', 'armenia', 'constantinople', 'smyrna',
									'syria', 'albania', 'belgium', 'bulgaria', 'finland', 'greece', 'holland', 'norway', 'north africa', 'portugal', 'rumania',
									'serbia', 'spain', 'sweden', 'tunis', 'adriatic sea', 'agean sea', 'baltic sea', 'barents sea', 'black sea',
									'eastern mediterranean', 'western mediterranean', 'english channel', 'gulf of bothnia', 'gulf of lyon', 
									'helgoland bight', 'ionian sea', 'irish sea', 'mid-atlantic ocean', 'north atlantic ocean', 'north sea',
									'norwegian sea', 'skagerrak', 'tyrrhenian sea']
	end
	
	
end