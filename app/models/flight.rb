class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings, foreign_key: :flight_id
  has_many :passengers, through: :bookings

  SUPPORTED_FILTERS = %i[departure_airport arrival_airport departure_time]
  scope :departure_airport, ->(value) { where(departure_airport_id: value) }
  scope :arrival_airport, ->(value) { where(arrival_airport_id: value) }
  scope :departure_time, ->(value) { where('DATE(departure_time) = ?', value.to_date) }

  def self.filter(attributes)
    attributes.permit(SUPPORTED_FILTERS).to_hash.reduce(all) do |scope, (key, value)|
      value.present? ? scope.send(key, value) : scope
    end
  end
end
