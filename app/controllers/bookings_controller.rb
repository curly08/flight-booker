class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passenger = @booking.passengers.build
    @flight = Flight.find(params[:book_flight][:selected_flight_id])
    @passenger_count = params[:book_flight][:passenger_count].to_i
  end

  private

  def booking_params
    params.require(:confirm_booking).permit(:selected_flight_id, :passenger_count, passenger_attributes: [:id, :name, :email])
  end
end
