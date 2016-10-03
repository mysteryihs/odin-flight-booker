class AddColumnToAirportIdToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :to_airport_id, :integer
  end
end
