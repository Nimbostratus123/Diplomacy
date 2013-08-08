class Move < ActiveRecord::Base
  attr_accessible :destination, :origin, :user_id
	belongs_to :user
	
	validates :user_id, presence: true
	
end
