class PagesController < ApplicationController
  def home
		@heading = 'Diplomacy'
  end

  def map
		@heading = 'Map'
		@title = @heading
  end


end
