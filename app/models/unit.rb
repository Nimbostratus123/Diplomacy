class Unit < ActiveRecord::Base
  attr_accessible :delay, :location, :kind, :destination
	attr_accessor  :user_name
	validates :user_id, :presence => true
	belongs_to :user
	
	validates :user_id, :presence => true
	
	def support?
		false
	end
	
	def fleet?
		if self.kind == 'fleet'
			return true
		else
			return false
		end
	end
	
	def army?
		if self.kind == 'army'
			return true
		else
			return false
		end
	end
	
	
end
