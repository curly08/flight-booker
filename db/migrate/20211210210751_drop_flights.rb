class DropFlights < ActiveRecord::Migration[6.1]
  def change
    drop_table :flights
  end
end
