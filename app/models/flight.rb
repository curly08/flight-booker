class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def self.format_dates
    all.map { |f| f.departure_time.strftime('%d/%m/%Y') }
  end
end
