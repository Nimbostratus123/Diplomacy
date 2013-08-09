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
			cookies.permanent[:remember_color] = '45B8FF'
		end
	end
		
	def title_color 
		unless cookies[:remember_color]
			return '#45B8FF'
		else
			return cookies[:remember_color]
		end
	end 
	
end