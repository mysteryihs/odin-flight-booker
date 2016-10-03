class RemoveStartFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :start, :string
    remove_column :flights, :finish, :string
  end
end
