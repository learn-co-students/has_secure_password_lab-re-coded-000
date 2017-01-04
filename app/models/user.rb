gem 'bcrypt'
class User < ActiveRecord::Base
  has_secure_password
  before_save  :password_matched?
  def password_matched?
     true if password==password_confirmation
  end
end
