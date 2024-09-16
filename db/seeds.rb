# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# require "csv" library so that you can import Destination data
require "csv"

User.delete_all
Destination.delete_all
Trip.delete_all
Stop.delete_all

# https://levelup.gitconnected.com/quickly-seeding-a-rails-database-using-a-csv-file-8438b8b68f05
CSV.foreach(Rails.root.join("lib/seed-data-from-simple-maps/worldcities-1mil-and-up.csv"), :headers => true) do |row|
  Destination.create!({
    :name => row["city_ascii"],
    :country => row["country"],
    :lat => row["lat"],
    :lng => row["lng"],
  })
end

# Travel Bug seed data
user = User.create!(:first_name => "Mark", :last_name => "Francisco", :username => "mark", :email => "m@example.com", :password => "password")
user2 = User.create!(:first_name => "Jamie", :last_name => "Jones", :username => "jonesy", :email => "j@example.com", :password => "password")

trip = Trip.create!(
  :title => "Olympic National Park",
  :owner_id => user.id,
  :collaborator_id => user2.id,
  :description => "Hiking trip -- otherwordly landscapes",
  :isComplete => true,
  :logistics => ["Rent a car", "Book ferry tickets", "Book accommodation"],
  :ideas => ["Bonfire at Ruby Beach", "Lunch at local diner", "Hoh Rainforest", "Hike around Hurricane Ridge mountaintop", "Twilight filming site in Forks town"],
)

Stop.create!(
  :trip_id => trip.id,
  :destination_id => Destination.first,
  :start_date => DateTime.new(2021, 7, 1),
  :end_date => DateTime.new(2021, 7, 7),
)
Stop.create!(
  :trip_id => trip.id,
  :destination_id => Destination.second,
  :start_date => DateTime.new(2021, 7, 1),
  :end_date => DateTime.new(2021, 7, 7),
)
