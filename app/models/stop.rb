class Stop < ApplicationRecord
  validates :trip_id, :presence => true
  validates :destination_id, :presence => true

  belongs_to :destination

  # def destination
  #   Destination.find_by(:id => destination_id)
  # end

  belongs_to :trip

  # def trip
  #   Trip.find_by(:id => trip_id)
  # end
end
