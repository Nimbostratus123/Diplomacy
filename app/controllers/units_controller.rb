class UnitsController < ApplicationController
	before_filter :signed_in_user   #    , :only => [:create, :destroy]
	
	def index
		
	end
	
  def new
		@unit = current_user.units.build if signed_in?
		@heading = @title = 'New Unit'
  end
	
	
	def create
		@unit = current_user.units.create(params[:unit])
		@unit.delay = (rand + rand)
		@unit.save!
		if @unit #&& @unit.legal?
			flash[:success] = "Your unit has been created."
			@heading = @title = 'New Unit'
			redirect_to root_url
		else
			render 'units/new'
		end
	end
	
	
	def destroy
		
	end
	
	
	def edit
		@unit = Unit.find(params[:id])
		@title = @heading = "Move Unit"
	end
	
	
	
	def update
		@unit = Unit.find(params[:id])
		@unit.destination = (params[:unit][:destination])
		if @unit.save
			flash[:success] = "Unit moved!"
			redirect_to root_url
		else
			@title = @heading = "#{@unit.location.capitalize}"
			flash[:error] = "Unit not moved"
			render 'edit'
		end
		
	end

	
	
	
end