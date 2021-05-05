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
User.create!(:first_name => "Mark", :last_name => "Francisco", :username => "mark", :email => "m@example.com", :password => "password")
User.create!(:first_name => "Jamie", :last_name => "Jones", :username => "jonesy", :email => "j@example.com", :password => "password")

Trip.create!(
  :title => "Olympic National Park",
  :owner_id => 1,
  :collaborator_id => 2,
  :description => "birthplace of celery",
  :isComplete => true,
  :logistics => ["rent a car and ferry over", "leave no trace"],
  :ideas => ["couple days here", "couple days there", "couple days everywhere"],
)

Stop.create!(
  :trip_id => 1,
  :destination_id => 2,
  :start_date => DateTime.new(2021, 7, 1),
  :end_date => DateTime.new(2021, 7, 7),
)
Stop.create!(
  :trip_id => 1,
  :destination_id => 3,
  :start_date => DateTime.new(2021, 7, 1),
  :end_date => DateTime.new(2021, 7, 7),
)
