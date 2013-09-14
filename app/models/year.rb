class Year < ActiveRecord::Base
  attr_accessible :count
  
  def advance
	self.count += 1
	save!  
  end
  
  def season
	 if self.count.even? 
		 return 'spring'
	 else
		 return 'fall'
	 end
  end
  
  def year
	  span = self.count
	  if span.odd?
		  span -= 1
	  end
	  1900 + span/2
  end
  
  def date
	 "#{self.season.capitalize} of #{year}" 
  end
  
end