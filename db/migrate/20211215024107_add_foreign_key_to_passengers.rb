class AddForeignKeyToPassengers < ActiveRecord::Migration[6.1]
  def change
    add_reference :passengers, :booking, foreign_key: true
  end
end
