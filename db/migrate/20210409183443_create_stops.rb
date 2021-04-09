class CreateStops < ActiveRecord::Migration[6.1]
  def change
    create_table :stops do |t|
      t.integer :trip_id
      t.integer :destination_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
