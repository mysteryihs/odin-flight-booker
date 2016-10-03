class AddColumnFromAirportIdToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :from_airport_id, :integer
  end
end
