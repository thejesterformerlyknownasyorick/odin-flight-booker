class RemoveTimeFromFlights < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :time, :time
  end
end
