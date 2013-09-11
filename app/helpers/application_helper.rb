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
	
	def unit_locations_for_select
		output = []
		Unit.all.each do |unit|
			output << unit.location
		end
		output << 'no support'
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
			'russia' => 'russian'
		}
		
	end
	
	def nations
		nations = [
			'austria',
			'turkey',
			'germany',
			'england',
			'france',
			'italy',
			'russia',
		]
		
	end
	
	
	
	def coordinates(region = 'middle of nowhere')
		location = regions[region]
		return "left: #{location[0]}px; top: #{location[1]}px;" unless location.nil?
	end

	
	
	
end