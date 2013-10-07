module MessagesHelper
	
	def select_user
		output = []
		User.all.each do |user|
			output << [user.name, user.id]
		end
		output
	end
	
	def not_read(messages)
		output = []
		messages.each do |message|
			output << message unless message.read
		end
		output
	end
	
	def only_read(messages)
		output = []
		messages.each do |message|
			output << message if message.read
		end
		output
	end
	
	def only_archived(messages)
		output = []
		messages.each do |message|
			output << message if message.archived
		end
		output
	end
	
	def not_archived(messages )
		output = []
		messages.each do |message|
			output << message unless message.archived
		end
		output
	end
	
end
