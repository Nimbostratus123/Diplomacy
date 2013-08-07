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
		cookies.permanent[:remember_token] = { value: color, expires: 2.years.from_now.utc }
	end
		
	def title_color 
		if :remember_token[1] =~ /e/
			return '45B8FF'
		else
			return :remember_token
		end
	end 
	
end