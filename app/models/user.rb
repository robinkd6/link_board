class User < ActiveRecord::Base
	validates :email,
	presence: true,
	uniqueness: {case_senstive: false}

	validates :name,
	presence: true,
	length: {
		maximum: 20,
		too_long: "The maximum is 20 characters "
	}
	
	#validates the presence of the password on create
	validates_presence_of :password, on: :create

	has_secure_password

	has_many :post

	def self_authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end
end
