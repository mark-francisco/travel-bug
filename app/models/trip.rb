class Trip < ApplicationRecord
  has_many :stops

  # def stops
  #   Stop.where(:trip_id => id)
  # end

  belongs_to :owner, :class_name => "User", :inverse_of => "trips_owned"
  belongs_to :collaborator, :class_name => "User", :inverse_of => "trips_collaborated", :optional => true

  # A Trip can have many Destinations
  has_many :destinations, :through => :stops
  # def destinations
  #   stops = Stop.where(:trip_id => id)

  #   destinations = stops.map { |stop|
  #     Destination.find_by(:id => stop.destination_id)
  #   }
  # end
end
