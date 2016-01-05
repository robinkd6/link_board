class User < ActiveRecord::Base
	validates :email,
	presence: true,
	uniqueness: {case_senstive: false}

	#validates the presence of the password on create
	validates_presence_of :password, on: :create

	has_secure_password

	def self_authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end
end
