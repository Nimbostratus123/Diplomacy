class Unit < ActiveRecord::Base
  attr_accessible :delay, :location, :kind, :destination
	attr_accessor  :user_name
	validates :user_id, :presence => true
	belongs_to :user
	
	validates :user_id, :presence => true
	
	def support?
		false
	end
	
end
