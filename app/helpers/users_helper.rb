module UsersHelper
	
	def nations_left(nation = nil)
		output = nations
		User.all.each do |user|
			output.delete(user.nation)
		end
		if nation
			output << nation
		end
		output
	end
	
	def area_cols
		if current_user.bio
			50
		else
			50
		end
	end
	
	def area_rows
		if current_user.bio
			5
		else	
			10
		end
	end	
		
	
end
