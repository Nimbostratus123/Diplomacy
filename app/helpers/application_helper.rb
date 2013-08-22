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
	
	def movement
		Unit.all.each do |unit|
			unit.location = unit.destination unless unit.destination.nil?
			unit.save!
		end
	end
	
	def unit_styles(unit)
		return "background-color: #{nation_colors[unit.user.nation]}; #{delays(unit)} #{borders(unit)}"
	end
	
	def borders(unit)
		if unit.fleet?
			return "border: 1px solid white;"
		end
	end
	
	def winning?(user)
		User.all.each do |other|
			if other.units.count >= user.units.count && other.id != user.id
				return false
			end
		end
		true
	end
	
	def tooltip(unit)
		"#{adjectival_form_of_nations[unit.user.nation].capitalize} #{unit.kind}"
	end
	

	def delays(unit)
		return "animation-delay: #{unit.delay}s; -webkit-animation-delay: #{unit.delay}s;"
	end
	
	def nation_colors
		nation_colors = {
			'austria' => '#FF26D4',
			'turkey' => 'red',
			'germany' => 'black',
			'england' => 'blue',
			'france' => 'purple',
			'italy' => 'green'
		}
	end
	
	def adjectival_form_of_nations
		adjectival_form_of_nations = {
			'austria' => 'austrian',
			'turkey' => 'turkish',
			'germany' => 'german',
			'england' => 'english',
			'france' => 'french',
			'italy' => 'italian',
		}
		
	end
	
	
	
	def coordinates(region = 'middle of nowhere')
		location = regions[region]
		return "left: #{location[0]}px; top: #{location[1]}px;" unless location.nil?
	end
	
	
	def regions
		regions = {
			'bohemia' => [560, 570], 
			'budapest' => [670, 625], 
			'galicia' => [740, 600],
 		 	'triest' => [600, 710],
			'tyrolia' => [500, 640], 
			'vienna' => [605, 610], 
			'clyde' => [295, 340], 
			'edinburgh' => [325, 350], 
			'liverpool' => [310, 420], 
			'london' => [340, 490], 
			'wales' => [290, 480],
			'yorkshire' => [340, 430],
			'brest' => [290, 580],
		  'burgundy' => [380, 620],
			'gascony' => [300, 670], 
			'marseilles' => [390, 680], 
			'paris' => [335, 585], 
			'picardy' => [360, 540], 
			'berlin' => [540, 500], 
			'kiel' => [480, 500], 
			'munich' => [490, 600], 
			'prussia' => [595, 490], 
			'ruhr' => [445, 550], 
			'silesia' => [600, 540], 
			'apulia' => [585, 805], 
			'napoli' => [550, 820], 
			'piedmonte' => [440, 680], 
			'roma' => [510, 785], 
			'tuscany' => [580, 740], 
			'venezia' => [490, 700], 
			'livonia' => [740, 380],
			'moscow' => [820, 430], 
			'sevastopol' => [900, 590], 
			'st. petersburg' => [820, 290], 
			'ukraine' => [800, 590], 
			'warsaw' => [690, 510], 
			'ankara' => [900, 800], 
			'armenia' => [1060, 780], 
			'constantinople' => [830, 825], 
			'smyrna' => [840, 870],
			'syria' => [1060, 860], 
			'albania' => [650, 810], 
			'belgium' => [380, 520], 
			'bulgaria' => [740, 770], 
			'finland' => [720, 270], 
			'greece' => [680, 840], 
			'holland' => [420, 490],
			'denmark' => [495, 390], 
			'norway' => [490, 320], 
			'north africa' => [230, 920], 
			'portugal' => [110, 720], 
			'rumania' => [740, 710],
			'serbia' => [670, 760], 
			'spain' => [180, 790], 
			'sweden' => [580, 330], 
			'tunisia' => [440, 920], 
			'adriatic sea' => [560, 750], 
			'agean sea' => [760, 900], 
			'baltic sea' => [620, 420], 
			'barents sea' => [830, 30], 
			'black sea' => [900, 720],
			'eastern mediterranean' => [840, 935],
			'western mediterranean' => [360, 850], 
			'english channel' => [270, 520], 
			'gulf of bothnia' => [650, 340], 
			'gulf of lyon' => [390, 780], 
			'helgoland bight' => [440, 430], 
			'ionian sea' => [620, 890], 
			'irish sea' => [210, 470], 
			'mid-atlantic ocean' => [200, 600], 
			'north atlantic ocean' => [200, 300], 
			'north sea' => [420, 350],
			'norwegian sea' => [450, 190], 
			'skagerrak' => [520, 350], 
			'tyrrhenian sea' => [475, 810],
			'middle of nowhere' => [-50, -50]
		}
	end
	
	
end