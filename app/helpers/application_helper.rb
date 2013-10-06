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
		cookies.permanent[:remember_color] = color.downcase
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
			output << unit.location if unit.location
		end
		output << 'no support'
	end
	
	def unit_styles(unit)
		return "background-color: #{nation_colors[unit.user.nation]}; #{delays(unit)} #{borders(unit)}" 
	end
	
	def too_many_units?
		if current_user.units.count > current_user.centers.count
			return true
		else
			return false
		end
	end
	
    def color_change
      set_color(params[:my_param])
  	redirect_to join_path
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
	
	def lighten(color, degree = 0.5)
		output = '#'
		reference = '0 1 2 3 4 5 6 7 8 9 a b c d e f'
		reference_a = reference.split(' ')
		reference = reference_a.join('')
		
		color.each_char do |char|
			unless char == '#'
				number = reference.index(char)
				number += (16 - number) * degree
				output << reference_a[number]
			end
		end
		output
	end
	
	def inverse(color, degree = 0.5)
		output = ''
		reference = '0 1 2 3 4 5 6 7 8 9 a b c d e f'
		reference_a = reference.split(' ')
		reference = reference_a.join('')
		
		color.each_char do |char|
			unless char == '#'
				number = reference.index(char)
				number -= (16 - number) * degree
				output << reference_a[number]
			end
		end
		'#' + output.reverse
	end
	
	def darken(color, degree = 0.5)
		output = '#'
		reference = '0 1 2 3 4 5 6 7 8 9 a b c d e f'
		reference_a = reference.split(' ')
		reference = reference_a.join('')
		
		color.each_char do |char|
			unless char == '#'
				number = reference.index(char)
				number *= degree
				output << reference_a[number.to_i]
			end
		end
		output
	end
	
	def nation_colors
		nation_colors = {
			'austria' => '#FF26D4',
			'turkey' => 'red',
			'germany' => 'black',
			'england' => 'blue',
			'france' => 'purple',
			'italy' => 'green',
			'russia' => 'white'
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
	
	def home_supply_centers
		main_centers = {
			'austria' => ['vienna', 'budapest', 'trieste'],
			'turkey' => ['ankara', 'smyrna', 'constantinople'],
			'germany' => ['munich', 'kiel', 'berlin'],
			'england' => ['liverpool', 'edinburgh', 'london'],
			'france' => ['paris', 'brest', 'marseilles'],
			'italy' => ['napoli', 'venezia', 'roma'],
			'russia' => ['moscow', 'warsaw', 'saint petersburg', 'stevastopol'],
		}
	end
	
	def coordinates(region = 'middle of nowhere')
		location = regions[region]
		unless location.nil?
			return "left: #{location[0]}px; top: #{location[1]}px;"
		else
			return "left:-50px;top-50px;"
		end
		
	end

	
	
	
end