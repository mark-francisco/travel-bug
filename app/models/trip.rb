class Trip < ApplicationRecord
  has_many :stops

  # def stops
  #   Stop.where(:trip_id => id)
  # end

  belongs_to :owner, :class_name => "User", :inverse_of => "trips_owned"
  belongs_to :collaborator, :class_name => "User", :inverse_of => "trips_collaborated", :optional => true
end
