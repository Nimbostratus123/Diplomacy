class MovesController < ApplicationController
	before_filter :signed_in_user, :only => [:create, :destroy]
	
	def index
		
	end
	
	def create
		@move = User.first.moves.create(params[:move])
		if @move #&& @move.legal?
			flash[:success] = "Your unit has been moved."
			redirect_to root_url
		else
			render 'pages/home'
		end
	end
	
	def destroy
		
	end
	
	
end