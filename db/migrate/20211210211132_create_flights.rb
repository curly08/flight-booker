class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :departure_airport, foreign_key: { to_table: :airports }
      t.references :arrival_airport, foreign_key: { to_table: :airports }
      t.datetime :departure_time
      t.integer :flight_duration

      t.timestamps
    end
  end
end
