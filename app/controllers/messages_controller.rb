class MessagesController < ApplicationController
	before_filter :signed_in_user

	def index
		@title = @heading = 'DiploMail'
		@messages = not_read(current_user.messages_to)
		@message = Message.new
	end
	
	def sent
		@title = @heading = 'DiploMail'
		@messages = current_user.messages_from
		@message = Message.new
	end
	
	def read
		@title = @heading = 'DiploMail'
		@messages = not_archived(only_read(current_user.messages_to))
		@message = Message.new
	end
	
	def seen
		@message = Message.find(params[:id])
		@message.read = true
		@message.save!
	end
	
	def create
		if Message.create(from: current_user.id, to: params[:message][:to], 
			subject: params[:message][:subject], content: params[:message][:content],
			read: false, archived: false)
			flash[:success] = 'Message sent.'
			redirect_to :back
		else 
			flash[:error] = 'Something went wrong. Please contact the web administrator.'
			redirect_to :back
		end
	end
	
end
