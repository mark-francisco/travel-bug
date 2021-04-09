class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.integer :owner_id
      t.integer :collaborator_id
      t.string :description
      t.boolean :completed?
      t.date :start_date
      t.date :end_date

      t.string :logistics, array: true
      t.string :ideas, array: true

      t.timestamps
    end
  end
end
