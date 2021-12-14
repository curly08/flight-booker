class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :flight, foreign_key: { to_table: :flights }
      t.references :passenger, foreign_key: { to_table: :passengers }

      t.timestamps
    end
  end
end
