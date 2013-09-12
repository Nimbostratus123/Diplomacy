class PagesController < ApplicationController
  def home
		@heading = 'Diplomacy'
		movement() if timed?()
		@move = current_user.moves.build if signed_in?
		@units = current_user.units.all if signed_in?
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