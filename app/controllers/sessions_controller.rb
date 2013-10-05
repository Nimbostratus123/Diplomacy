class SessionsController < ApplicationController
	
  def new
		@title = 'Sign In'
		@heading = 'Sign In'
  end
	
	
	
	def create
		
		@user = User.find_by_email(params[:session][:email])
		
		if @user.nil?
			flash[:error] = "Invalid e-mail/password combination"
			@title = "Sign In"
			@heading = "Sign In"
			render 'new'
		else
			unless @user.has_password?(params[:session][:password])
				flash[:error] = "Invalid e-mail/password combination"
				@title = "Sign In"
				@heading = "Sign In"
				render 'new'
			else
				sign_in @user
				redirect_to @user
			end
		end
	end
	
	
	
	def destroy
		sign_out
		redirect_to root_path
	end
	
end
