class RemoveBookingForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_reference :bookings, :passenger_id, index: true
  end
end
