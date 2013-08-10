class PagesController < ApplicationController
  def home
		@heading = 'Diplomacy'
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