class User < ApplicationRecord
  # "has_secure_password" helper method provided by bcrypt gem
  has_secure_password
  # validates :email, presence: true, uniqueness: true

end
