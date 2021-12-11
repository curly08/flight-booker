class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.id, a.code] }
    @available_dates = Flight.all.map { |f| [f.departure_time, f.departure_time.strftime('%d/%m/%Y')] }
    @flights = Flight.filter(flight_search_params)
  end

  private

  def flight_search_params
    params.require(:search).permit(:departure_airport, :arrival_airport, :departure_time, :passenger_count)
  end
end
