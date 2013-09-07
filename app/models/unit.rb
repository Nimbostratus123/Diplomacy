class Unit < ActiveRecord::Base
  attr_accessible :delay, :location, :kind, :destination
	attr_accessor  :user_name
	validates :user_id, :presence => true
	belongs_to :user
	
	validates :user_id, :presence => true
	
	include ApplicationHelper
	include UnitsHelper
	
	def support?
		false
	end
	
	def legal?
		true
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
	
	def adjacent?(place)
		one = relations().select { |pair| pair[0] == self.location && pair[1] == place }
		two = relations().select { |pair| pair[0] == place && pair[1] == self.location }
		if one.empty? && two.empty?
			false
		else
			true
		end
	end
	
	def surroundings
		if kind != 'fleet'
			surroundings = regions().keys.select do |region| 
				self.adjacent?(region) && land?(region) 
			end
			surroundings.unshift location					   
		else
			surroundings = regions().keys.select do |region|       	# Works!
				self.adjacent?(region) && water_adjacent?(region)  	# Holy crap I should really
			end 												   	# be using tests.
			surroundings.unshift location	
		end                                                           
		surroundings                                                  	
	end
	
end

