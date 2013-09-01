class Unit < ActiveRecord::Base
  attr_accessible :delay, :location, :kind, :destination, :updated_at
	attr_accessor  :user_name
	validates :user_id, :presence => true
	belongs_to :user
	
	validates :user_id, :presence => true
	
	include ApplicationHelper
	
	
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
	
	def timed?
		true
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
		outlist = []
		relations().each do |relation|
			if self.adjacent?(relation[0])
				outlist << relation[0] unless outlist.include?(relation[0])
			elsif self.adjacent?(relation[1])
				outlist << relation[1] unless outlist.include?(relation[1])
			end
		end
		outlist
	end
	
	
end

