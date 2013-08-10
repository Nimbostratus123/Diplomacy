class Move < ActiveRecord::Base
	belongs_to :user
	attr_accessor  :destination, :origin, :user_id
  attr_accessible :destination, :origin, :user_id
	validates :user_id, presence: true
	
end
