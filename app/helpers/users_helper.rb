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
	
end
