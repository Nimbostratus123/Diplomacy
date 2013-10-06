class MessagesController < ApplicationController
	before_filter :signed_in_user

	def index
		@title = @heading = 'DiploMail'
		@messages =current_user.messages_to
	end

	def new
		@title = @heading = 'New Message'
		@message = Message.new
	end
	
	def create
		if Message.create(from: current_user.id, to: User.find_by_name(params[:message][:to]).id, 
			subject: params[:message][:subject], content: params[:message][:subject],
			read: false, archived: false)
			flash[:success] = 'Message sent.'
			redirect_to :back
		else 
			flash[:error] = 'Something went wrong. Please contact the web administrator.'
			redirect_to :back
		end
	end
	
end
