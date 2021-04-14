class UpdateCompletedToIsComplete < ActiveRecord::Migration[6.1]
  def change
    rename_column :trips, :completed?, :isComplete
  end
end
