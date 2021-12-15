class Passenger < ApplicationRecord
  belongs_to :booking
  delegate :flight, to: :booking, allow_nil: true

  validates :name, presence: true
  validates :email, presence: true
end
