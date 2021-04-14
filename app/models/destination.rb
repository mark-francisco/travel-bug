class Destination < ApplicationRecord
  has_many :stops

  # def stops
  #   Stop.where(:destination_id => id)
  # end
end
