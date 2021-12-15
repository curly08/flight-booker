class RemoveBookingKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :bookings, :passengers
    remove_column :bookings, :passenger_id, index: true
  end
end
