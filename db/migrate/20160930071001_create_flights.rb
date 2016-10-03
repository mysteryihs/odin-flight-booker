class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :start
      t.string :finish
      t.string :date
      t.integer :duration

      t.timestamps
    end
  end
end
