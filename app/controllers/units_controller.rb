class UnitsController < ApplicationController
	before_filter :signed_in_user   #    , :only => [:create, :destroy]
	
	def index
		
	end
	
  def new
		@unit = current_user.units.build if signed_in?
		@heading = @title = 'New Unit'
  end
	
	
	def create
		@user = User.find_by_name(params[:unit][:user_name])
		unless @user.nil?

			params[:unit].delete :user_name
			@unit = @user.units.create(params[:unit])
			@unit.delay = rand
			@unit.delay *= -1.5
			@unit.save!
			
			if @unit 
				flash[:success] = "Your unit has been created."
				@heading = @title = 'New Unit'
				redirect_to root_url
			else
				render 'units/new'
			end
			
		else
			
			render 'units/new'
			
		end
	end
	
	
	def destroy
		
	end
	
	
	def edit
		@unit = Unit.find(params[:id])
		@unit.delay = rand
		@unit.delay *= -1.5
		@unit.save!
		@title = @heading = "Move Unit"
	end
	
	
	
	def update
		@unit = Unit.find(params[:id])
		@unit.destination = (params[:unit][:destination])
		if @unit.timed? 
			@unit.save
			flash[:success] = "Unit moved!"
			redirect_to root_url
		else
			@title = @heading = "#{@unit.location.capitalize}"
			flash[:error] = "You've already moved that unit today!"
			redirect_to root_url
		end
		
	end

	
	
	
end