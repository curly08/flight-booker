class FlightsController < ApplicationController
  def index
    @flights = Flight.filter(flight_search_params).map do |f|
      flight_info = "ID: #{f.id}\nLeaving: #{f.departure_airport.code}\nArriving: #{f.arrival_airport.code}\nDeparture Time: #{f.departure_time.strftime('%d/%m/%Y %I:%M%P')}"
      [flight_info, f]
    end
  end

  private

  def flight_search_params
    params.require(:search).permit(:departure_airport, :arrival_airport, :departure_time, :passenger_count)
  end
end
