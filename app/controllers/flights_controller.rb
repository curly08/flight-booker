class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map(&:code)
    @available_dates = Flight.format_dates
  end
end
