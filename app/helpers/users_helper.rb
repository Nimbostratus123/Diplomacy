module UsersHelper
	
	def bio_content
		current_user[:bio].sub(/'' \-\- .+/, '').sub(/.*''/, '').reverse.chomp.reverse
	end
	
end
