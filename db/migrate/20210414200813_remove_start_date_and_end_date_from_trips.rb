class RemoveStartDateAndEndDateFromTrips < ActiveRecord::Migration[6.1]
  def change
    remove_column :trips, :start_date, :date
    remove_column :trips, :end_date, :date
  end
end
