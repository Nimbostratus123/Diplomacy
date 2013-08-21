class PagesController < ApplicationController
  def home
		@heading = 'Diplomacy'
		@move = current_user.moves.build if signed_in?
		@units = current_user.units.all if signed_in?
  end

  def map
		@heading = 'Map'
		@title = @heading
  end
	
	
	def color_change
	  set_color(params[:my_param])
		redirect_to join_path
	end
	
	
end