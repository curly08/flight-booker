class Passenger < ApplicationRecord
  belongs_to :booking
  has_many :flights, through: :bookings, source: :flight
end
