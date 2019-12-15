class User < ActiveRecord::Base
	has_secure_password
	before_save :is_valid?
	def is_valid?
		password == password_confirmation || password_confirmation == nil && self.password != nil
	end
end
