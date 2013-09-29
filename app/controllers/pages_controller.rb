class PagesController < ApplicationController
  def home
		@heading = 'Diplomacy'
		movement() if timed?()
		@move = current_user.moves.build if signed_in?
		@units = current_user.units.all if signed_in?
		if signed_in? && too_many_units?
			flash[:error] = 'You have lost a supply center. If you do not destroy one of your units now, a unit will be destroyed at random.'
			flash.discard(:error)
		elsif signed_in? && current_user.new_units_count > 0
			flash[:success] = "Don't forget to place your units! Simply click the large 'U' in the upper left corner."
			flash.discard(:success)
		end
  end

  def map
		@heading = 'Map'
		@title = @heading
		randomize_delays()
		movement() if timed?()
		@units = Unit.all
  end
		
  def color_change
    set_color(params[:my_param])
	redirect_to join_path
  end
	
	
end