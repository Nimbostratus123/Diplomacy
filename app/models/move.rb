class Move < ActiveRecord::Base
	belongs_to :user
	attr_accessor :user_id
  attr_accessible :destination, :origin
	
	validates :user_id, :presence => true
	validates :origin, :presence => true
	validates :destination, :presence => true
	
end
