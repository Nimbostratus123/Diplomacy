class Unit < ActiveRecord::Base
  attr_accessible :delay, :location, :kind, :destination
	validates :user_id, :presence => true
	belongs_to :user
	
	validates :user_id, :presence => true
	
	
end
