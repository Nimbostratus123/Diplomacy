require 'digest'
class User < ActiveRecord::Base

	attr_accessor :password, :bio
  attr_accessible :email, :name, :password, :password_confirmation, :nation, 
	#has_many :moves
	
	
	email_regex = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
	
	validates :name, :presence => true,
						:length => { :maximum => 50 }
	validates :email, :presence => true,
						:length => { :within => 6..40 },
						:uniqueness => { :case_sensitive => false }
#	validates :password, :confirmation => true #:presence => true, 
#						:length => { :within => 6..40 }
	validates :nation, :presence => true,
						:uniqueness => true
						
	before_save :encrypt_password
	
	def has_password?(submitted_password)
		self.encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end
	
	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		return nil if user.nil?
		return user if user.salt == cookie_salt
	end
	
	private
		
		def encrypt_password
			(self.salt = make_salt) if new_record?
			self.encrypted_password = encrypt(self.password)
		end
		
		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end
		
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end
		
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
						
end
