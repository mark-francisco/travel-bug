class User < ApplicationRecord
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  # "has_secure_password" helper method is provided by bcrypt gem
  has_secure_password

  # if a User is destroyed, all of its dependent Trips will also be destroyed
  has_many :trips_owned, :class_name => "Trip", :foreign_key => "owner_id", :inverse_of => "owner", :dependent => :destroy
  has_many :trips_collaborated, :class_name => "Trip", :foreign_key => "collaborator_id", :inverse_of => "collaborator", :dependent => :destroy
end
