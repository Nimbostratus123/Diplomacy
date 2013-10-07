require 'digest'
class User < ActiveRecord::Base
	
	attr_accessor :password
  	attr_accessible :email, :name, :password, :password_confirmation, :nation, :bio, :encrypted_password
	has_many :moves, dependent: :destroy
	has_many :units
	
	email_regex = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
	
	validates :name, :presence => true,
						:length => { :maximum => 50 }
	validates :email, :presence => true,
						:length => { :within => 6..40 },
						:uniqueness => { :case_sensitive => false }
	validates :password, :confirmation => true, :presence => true, 
						:length => { :within => 6..40 }
	validates :nation, :presence => true,
						:uniqueness => true
						
	before_save :encrypt_password
	
	def has_password?(submitted_password)
		self.encrypted_password == encrypt(submitted_password)
	end
	
	def centers
		output = []
		Center.all.each do |center|
			if center.nation == self.nation
				output << center
			end
		end
		output
	end
	
	def new_units_count
		count = 0
		self.units.each do |unit|
			unless unit.location
				count += 1
			end
		end
		count
	end
	
	def obscure_centers
		output = []
		self.centers.each do |center|	
			if center.latest != center.nation
				output << center
			end	
		end
		output
	end
	
	def messages_from
		output = []
		Message.all.each do |message|
			if message.from == self.id
				output << message
			end
		end
		output
	end
	
	def messages_to
		output = []
		Message.all.each do |message|
			if message.to == self.id
				output << message
			end
		end
		output
	end
	
	def new_messages
		output = []
		self.messages_to.each do |message|
			output << message unless message.read
		end
		output
	end
	
	def remove_unit
		self.units.all.shuffle.first.delete
	end
	
	def add_unit
		self.units.create!(:delay => (rand*(-1.5)), :support => 0, :supporting => "false")
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
			(self.salt = make_salt) if self.created_at == self.updated_at
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
