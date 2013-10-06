class Message < ActiveRecord::Base
  attr_accessible :content, :from, :to, :subject, :read, :archived
  
  def from_whom
	  User.find(self.from)
  end
  
  def to_whom
	  User.find(self.to)
  end
  
end
