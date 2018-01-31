class User < ApplicationRecord
	has_many :memos
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	# used for login
	# method searches for user with specific email in database and checks to make
	# sure the email field is not nil
	# also checks to make sure the password tied to the user was hashed properly 
	def self.authenticate(email, password)
		user = self.find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)		
			user
		else
			# else returned nil
			nil
		end
	end

	def encrypt_password do
		# if password is present in user model for single user 
		# password is encrypted
		if password.present?
			self.password_salt == BCrypt::Engine.generate_salt
			self.password_hash == BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	# unique token is generated for single user
	def generate_token
		token_gen = SecureRandom.hex
		self.token = token_gen
		token_gen
	end
end
