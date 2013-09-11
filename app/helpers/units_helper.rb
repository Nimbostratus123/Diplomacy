module UnitsHelper
	
	
	def movement # Works!
		set_unmovable()
		Unit.all.each do |unit|
			if unit.destination
				unless unit.location == unit.destination
					unit.latest = unit.location
				end
				
				unit.location = unit.destination 
				
				unit.save!
				
			end
		end
		reset_support()
	end
	
	def reset_support
		Unit.all.each do |unit|
			unit.supporting = 'false'
			unit.support = 0
			unit.save!
		end
	end
	
	
	
	def set_unmovable
		regions.keys.each do |region|
			
			@specifics = Unit.all.select { |unit| unit.destination == region }

			
			@max_support = 0
			@top_units = []
                                                              # IT WORKS!!
			@specifics.each do |unit|                         # IT WORKS!!
				if unit.support > @max_support                # IT WORKS!!
					@max_support = unit.support               # IT WORKS!!
				end                                           # IT WORKS!!
			end                                               # IT WORKS!!
                                                              # IT WORKS!!
			@specifics.each do |unit|                         # IT WORKS!!
				if unit.support == @max_support               # IT WORKS!!
					@top_units << unit                        # IT WORKS!!
				else                                          # IT WORKS!!
					unit.dont_move                            # IT WORKS!!
				end                                           # IT WORKS!!
			end                                               # IT WORKS!!
                                                              # IT WORKS!!
			if @top_units.count > 1                           # IT WORKS!!
				@top_units.each do |unit|                     # IT WORKS!!
					unit.dont_move                            # IT WORKS!!
				end 
			end
		end
		
	end
	
	
	
	def timed? # This works now
		move = true
		Unit.all.each do |unit|
			if unit.updated_at > Time.now.beginning_of_day
				move = false
			end
		end
		move
	end
	
	
	
	
	def water_adjacent?(location)
		tell = false
		waters.each do |water|
			if adjacency(water, location)
				tell = true
			elsif location == water
				tell = true
			end
		end
		tell
	end
	
	def land?(location)
		if waters.include?(location)
			return false
		else
			return true
		end
	end
	
	def adjacency(place1, place2)
		one = relations().select { |pair| pair[0] == place2 && pair[1] == place1 }
		two = relations().select { |pair| pair[0] == place1 && pair[1] == place2 }
		if one.empty? && two.empty?
			false
		else
			true
		end
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	def selectify(list)
		finish = []
		list.each do |item|
			finish += [[ item.split.map(&:capitalize).join(' '), item]]
		end
		return finish
	end
	
	def destify(unit)
		if unit.destination
			return unit.destination
		else
			return unit.location
		end
	end
	
	def regions
		regions = {
			'bohemia' => [560, 570], 
			'budapest' => [670, 625],
			'galicia' => [740, 600],
 		 	'trieste' => [600, 710],
			'tyrolia' => [500, 640], 
			'vienna' => [605, 610], 
			'clyde' => [295, 340], 
			'edinburgh' => [325, 350], 
			'liverpool' => [310, 420], 
			'london' => [340, 490], 
			'wales' => [290, 480],
			'york' => [340, 430],
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
			'piemonte' => [440, 680], 
			'roma' => [510, 785], 
			'tuscany' => [580, 740], 
			'venezia' => [490, 700], 
			'livonia' => [740, 380],
			'moscow' => [820, 430], 
			'stevastopol' => [900, 590], 
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
			'mid atlantic' => [200, 600], 
			'north atlantic' => [200, 300], 
			'north sea' => [420, 350],
			'norwegian sea' => [450, 190], 
			'skagerrak' => [520, 350], 
			'tyrrhenian sea' => [475, 810],
			'switzerland' => [440, 640],
			'snake island' => [950, 640],
			'middle of nowhere' => [-50, -50]
		}
	end
	
	
	def relations
		relations = [
			["piemonte", "tyrolia"],
			["greece", "bulgaria"],
			["norway", "seden"],
			["sweden", "finland"],
			["finland", "saint petersburg"],
			["saint petersburg", "moscow"],
			["moscow", "livonia"],
			["livonia", "saint petersburg"],
			["moscow", "stevastopol"],
			["stevastopol", "ukraine"],
			["ukraine", "moscow"],
			["warsaw", "ukraine"],
			["moscow", "warsaw"],
			["saint petersburg", "norway"],
			["stevastopol", "armenia"],
			["armenia", "syria"],
			["warsaw", "livonia"],
			["prussia", "livonia"],
			["syria", "smyrna"],
			["smyrna", "ankara"],
			["ankara", "armenia"],
			["smyrna", "constantinople"],
			["constantinople", "ankara"],
			["constantinople", "bulgaria"],
			["bulgaria", "rumania"],
			["rumania", "serbia"],
			["serbia", "bulgaria"],
			["serbia", "albania"],
			["serbia", "greece"],
			["albania", "greece"],
			["serbia", "rumania"],
			["rumania", "stevastopol"],
			["rumania", "ukraine"],
			["rumania", "budapest"],
			["rumania", "galicia"],
			["serbia", "budapest"],
			["serbia", "trieste"],
			["galicia", "ukraine"],
			["galicia", "warsaw"],
			["trieste", "budapest"],
			["budapest", "vienna"],
			["trieste", "vienna"],
			["budapest", "galicia"],
			["galicia", "vienna"],
			["vienna", "bohemia"],
			["bohemia", "tyrolia"],
			["bohemia", "galicia"],
			["tyrolia", "trieste"],
			["bohemia", "silesia"],
			["silesia", "warsaw"],
			["warsaw", "prussia"],
			["prussia", "silesia"],
			["silesia", "galicia"],
			["silesia", "berlin"],
			["berlin", "prussia"],
			["bohemia", "munich"],
			["silesia", "munich"],
			["tyrolia", "munich"],
			["munich", "ruhr"],
			["munich", "kiel"],
			["munich", "berlin"],
			["ruhr", "kiel"],
			["kiel", "berlin"],
			["kiel", "denmark"],
			["denmark", "sweden"],
			["tyrolia", "vienna"],
			["tyrolia", "venezia"],
			["trieste", "venezia"],
			["piemonte", "venezia"],
			["venezia", "tuscany"],
			["venezia", "roma"],
			["roma", "apulia"],
			["apulia", "venezia"],
			["apulia", "napoli"],
			["roma", "napoli"],
			["roma", "tuscany"],
			["kiel", "holland"],
			["ruhr", "holland"],
			["holland", "belgium"],
			["ruhr", "belgium"],
			["belgium", "picardy"],
			["belgium", "burgundy"],
			["picardy", "paris"],
			["paris", "burgundy"],
			["burgundy", "marseilles"],
			["piemonte", "tuscany"],
			["marseilles", "piemonte"],
			["marseilles", "gascony"],
			["gascony", "burgundy"],
			["gascony", "paris"],
			["gascony", "brest"],
			["brest", "paris"],
			["brest", "picardy"],
			["london", "wales"],
			["york", "london"],
			["liverpool", "wales"],
			["liverpool", "york"],
			["york", "edinburgh"],
			["liverpool", "edinburgh"],
			["liverpool", "clyde"],
			["clyde", "edinburgh"],
			["gascony", "spain"],
			["spain", "marseilles"],
			["spain", "portugal"],
			["north africa", "tunisia"],
			["barents sea", "saint petersburg"],
			["barents sea", "norway"],
			["barents sea", "norwegian sea"],
			['norwegian sea', 'edinburgh'],
			['norwegian sea', 'clyde'],
			["norwegian sea", "norway"],
			["norwegian sea", "north sea"],
			["norwegian sea", "north atlantic"],
			["north sea", "skagerrak"],
			["north sea", "helgoland bight"],
			["north sea", "english channel"],
			["skagerrak", "baltic sea"],
			["north sea", "edinburgh"],
			["north sea", "york"],
			["north sea", "london"],
			["north sea", "belgium"],
			["north sea", "holland"],
			["north sea", "denmark"],
			["north sea", "norway"],
			["skagerrak", "denmark"],
			["skagerrak", "norway"],
			["skagerrak", "sweden"],
			["skagerrak", "baltic sea"],
			["baltic sea", "sweden"],
			["baltic sea", "gulf of bothnia"],
			["baltic sea", "berlin"],
			["baltic sea", "kiel"],
			["baltic sea", "prussia"],
			["baltic sea", "livonia"],
			["helgoland bight", "denmark"],
			["helgoland bight", "kiel"],
			["helgoland bight", "holland"],
			["gulf of bothnia", "finland"],
			["gulf of bothnia", "saint petersburg"],
			["gulf of bothnia", "livonia"],
			["gulf of bothnia", "sweden"],
			["north atlantic", "clyde"],
			["north atlantic", "irish sea"],
			["north atlantic", "mid atlantic"],
			['north atlantic', 'liverpool'],
			["irish sea", "wales"],
			["irish sea", "english channel"],
			["irish sea", "liverpool"],
			["irish sea", "mid atlantic"],
			["mid atlantic", "english channel"],
			["mid atlantic", "spain"],
			["mid atlantic", "portugal"],
			["mid atlantic", "west mediterranean"],
			["mid atlantic", "north africa"],
			["mid atlantic", "brest"],
			["mid atlantic", "gascony"],
			["english channel", "brest"],
			["english channel", "wales"],
			["english channel", "london"],
			["english channel", "picardy"],
			["english channel", "belgium"],
			["english channel", "north sea"],
			["west mediterranean", "north africa"],
			["west mediterranean", "gulf of lyon"],
			["west mediterranean", "spain"],
			["west mediterranean", "tunisia"],
			["west mediterranean", "tyrhennian sea"],
			["gulf of lyon", "spain"],
			["gulf of lyon", "marseilles"],
			["gulf of lyon", "piemonte"],
			["gulf of lyon", "tuscany"],
			["gulf of lyon", "tyrhennian sea"],
			["tyrhennian sea", "roma"],
			["tyrhennian sea", "napoli"],
			["tyrhannian sea", "tunisia"],
			["tyrhennian sea", "ionian sea"],
			["tyrhennian sea", "tuscany"],
			["ionian sea", "tunisia"],
			["ionian sea", "napoli"],
			["ionian sea", "apulia"],
			["ionian sea", "adriatic sea"],
			["ionian sea", "greece"],
			["ionian sea", "albania"],
			["ionian sea", "aegean sea"],
			["ionian sea", "east mediterranean"],
			["adriatic sea", "trieste"],
			["adriatic sea", "venezia"],
			["adriatic sea", "apulia"],
			["adriatic sea", "albania"],
			["east mediterranean", "syria"],
			["east mediterranean", "smyrna"],
			["east mediterranean", "aegean sea"],
			["aegean sea", "smyrna"],
			["aegean sea", "greece"],
			["baltic sea", "denmark"],
			["helgoland bight", "denmark"],
			["aegean sea", "bulgaria"],
			["aegean sea", "constantinople"],
			["black sea", "constantinople"],
			["black sea", "bulgaria"],
			["black sea", "rumania"],
			["black sea", "stevastopol"],
			["black sea", "armenia"],
			["black sea", "ankara"],
			["snake island", "switzerland"],
			["middle of nowhere", "snake island"],
			["middle of nowhere", "switzerland"]
		]
	end		
	
	def water_relations
		water_relations = [
		["north africa", "tunisia"],
		["barents sea", "saint petersburg"],
		["barents sea", "norway"],
		["barents sea", "norwegian sea"],
		["norwegian sea", "norway"],
		["norwegian sea", "north sea"],
		["norwegian sea", "north atlantic"],
		["north sea", "skagerrak"],
		["north sea", "helgoland bight"],
		["north sea", "english channel"],
		["skagerrak", "baltic sea"],
		["north sea", "edinburgh"],
		["north sea", "york"],
		["north sea", "london"],
		["north sea", "belgium"],
		["north sea", "holland"],
		["north sea", "denmark"],
		["north sea", "norway"],
		["skagerrak", "denmark"],
		["skagerrak", "norway"],
		["skagerrak", "sweden"],
		["baltic sea", "sweden"],
		["baltic sea", "gulf of bothnia"],
		["baltic sea", "berlin"],
		["baltic sea", "kiel"],
		["baltic sea", "prussia"],
		["baltic sea", "denmark"],
		["baltic sea", "livonia"],
		["helgoland bight", "denmark"],
		["helgoland bight", "kiel"],
		["helgoland bight", "holland"],
		["gulf of bothnia", "finland"],
		["gulf of bothnia", "saint petersburg"],
		["gulf of bothnia", "livonia"],
		["gulf of bothnia", "sweden"],
		["north atlantic", "clyde"],
		["north atlantic", "irish sea"],
		["north atlantic", "mid atlantic"],
		["irish sea", "wales"],
		["irish sea", "english channel"],
		["irish sea", "liverpool"],
		["irish sea", "mid atlantic"],
		["mid atlantic", "english channel"],
		["mid atlantic", "spain"],
		["mid atlantic", "portugal"],
		["mid atlantic", "west mediterranean"],
		["mid atlantic", "north africa"],
		["mid atlantic", "brest"],
		["mid atlantic", "gascony"],
		["english channel", "brest"],
		["english channel", "wales"],
		["english channel", "london"],
		["english channel", "picardy"],
		["english channel", "belgium"],
		["english channel", "north sea"],
		["west mediterranean", "north africa"],
		["west mediterranean", "gulf of lyon"],
		["west mediterranean", "spain"],
		["west mediterranean", "tunisia"],
		["west mediterranean", "tyrhennian sea"],
		["gulf of lyon", "spain"],
		["gulf of lyon", "marseilles"],
		["gulf of lyon", "piemonte"],
		["gulf of lyon", "tuscany"],
		["gulf of lyon", "tyrhennian sea"],
		["tyrhennian sea", "roma"],
		["tyrhennian sea", "napoli"],
		["tyrhennian sea", "tunisia"],
		["tyrhennian sea", "ionian sea"],
		["tyrhennian sea", "tuscany"],
		["ionian sea", "tunisia"],
		["ionian sea", "napoli"],
		["ionian sea", "apulia"],
		["ionian sea", "adriatic sea"],
		["ionian sea", "greece"],
		["ionian sea", "albania"],
		["ionian sea", "aegean sea"],
		["ionian sea", "east mediterranean"],
		["adriatic sea", "trieste"],
		["adriatic sea", "venezia"],
		["adriatic sea", "apulia"],
		["adriatic sea", "albania"],
		["east mediterranean", "syria"],
		["east mediterranean", "smyrna"],
		["east mediterranean", "aegean sea"],
		["aegean sea", "smyrna"],
		["aegean sea", "greece"],
		["aegean sea", "bulgaria"],
		["aegean sea", "constantinople"],
		["black sea", "constantinople"],
		["black sea", "bulgaria"],
		["black sea", "rumania"],
		["black sea", "stevastopol"],
		["black sea", "armenia"],
		['norwegian sea', 'edinburgh'],
		['norwegian sea', 'clyde'],
		["black sea", "ankara"],
		["middle of nowhere", "snake island"],
		["middle of nowhere", "switzerland"],
		]
	end
	
	def waters
		waters = [
		"north africa",
		"barents sea",
		"norwegian sea",
		"north sea",
		"skagerrak",
		"baltic sea",
		"helgoland bight",
		"gulf of bothnia",
		"north atlantic",
		"irish sea",
		"mid atlantic",
		"english channel",
		"west mediterranean",
		"gulf of lyon",
		"tyrhennian sea",
		"ionian sea",
		"adriatic sea",
		"east mediterranean",
		"aegean sea",
		"black sea",
		"middle of nowhere",
		]
	end
	
end