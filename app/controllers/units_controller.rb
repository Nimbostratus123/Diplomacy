class UnitsController < ApplicationController
	before_filter :signed_in_user   #    , :only => [:create, :destroy]

	
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
		@unit = Unit.find(params[:id])
		@unit.delete
		redirect_to root_url
	end
	
	
	def edit
		@unit = Unit.find(params[:id])
		# @unit.delay = rand
		# @unit.delay *= -1.5
		# @unit.save!
		movement() if timed?()
		@title = @heading = "Move Unit"
		if params[:unit_support]
			@telltalesign = true
			intent = Unit.find_by_location(params[:unit_support])
			
			unless @unit.close_enough?(intent) # Working!
				@telltalesign = false
			end
			
			if params[:unit_support] != 'no support' && @telltalesign
				@unit.destination = @unit.location
				if @unit.supporting?
					u = Unit.find_by_location(@unit.supporting)
					u.support -= 1
					u.save!
				end
				@unit.supporting = params[:unit_support]
				@unit.save!
				@other_unit = Unit.find_by_location(params[:unit_support])
				if @other_unit.nil?
					flash[:error] = "Something went wrong – There is no unit by that name."
					redirect_to root_url
				else
					@other_unit.support += 1
					@other_unit.save!
					flash[:success] = "Unit is now supporting"
					redirect_to root_url
				end
			else
				if @unit.supporting?
					u = Unit.find_by_location(@unit.supporting) 
					u.support -= 1
					u.save!
				end
				@unit.supporting = 'false'
				@unit.save!
				flash[:error] = "Unit is too far away to support, or support has ended."
				redirect_to root_url
			end
		end
	end
	
	def update
		@unit = Unit.find(params[:id])
		@unit.destination = (params[:unit][:destination])
		if @unit.supporting?
			flash[:error] = "That unit supporting and cannot be moved this turn."
			redirect_to root_url
		elsif @unit.save
			flash[:success] = "Destination changed! Movement occurs at 0:00"
			redirect_to root_url
		else
			flash[:error] = "Movement did not happen."
			redirect_to root_url
		end
		
	end

	
	
	
    def unplaced
  	  @new_units = current_user.units.select { |unit| unit.location.nil? }
  	  @heading = @title = 'New Units'
    end
	
	def place
		@unit = Unit.find(params[:id])
		if u = Unit.find_by_location(params[:unit][:location])
			flash[:error] = "There is already a unit in that location."
			redirect_to :back
		elsif params[:unit][:kind].nil?
			flash[:error] = "Please choose which kind of unit to place." 
			redirect_to :back                                            
		elsif wrong_kind?(params[:unit][:kind], params[:unit][:location])
			flash[:error] = "You cannot build fleets in that location."  
			redirect_to :back
		else                                                             
			@unit.location = params[:unit][:location]                    
			@unit.kind = params[:unit][:kind]
			if @unit.save!
				flash[:success] = 'Your unit has been placed!'
			else
				flash[:error] = 'Something went wrong. Please contact system administrator.'
			end
			redirect_to root_url
		end
	end
	
	
	
	
	
end