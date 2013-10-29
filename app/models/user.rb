require 'bcrypt'

class User
	include Mongoid::Document
	has_and_belongs_to_many :uprojects, class_name: 'Project', inverse_of: :pusers 

	attr_accessor :password, :password_confirmation

	field :email, type: String
	field :salt, type: String
	field :hashed_password, type: String
	field :provider, type: String
	field :uid, type: String

	field :token, type: String

before_save :hash_password
validates :email, presence: true
validates :email, uniqueness: {case_sensitive: false}
validates :password, confirmation: true

def authenticate (password)
	self.hashed_password ==
	 BCrypt::Engine.hash_secret(password, self.salt)
	end

	private
	def hash_password
		if self.password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.hashed_password = 
			 BCrypt::Engine.hash_secret(password, self.salt)
			password = password_confirmation = nil
		end
	end
end