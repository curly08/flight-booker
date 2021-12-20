class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passenger_count = params[:book_flight][:passenger_count].to_i
    @passenger_count.times { @booking.passengers.build }
    @flight = Flight.find(params[:book_flight][:selected_flight_id])
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = Booking.new(booking_params)

    if @booking.save
      @recipients = @booking.passengers
      @recipients.each do |recipient|
        PassengerMailer.with(booking: @booking).confirmation_email(recipient).deliver_later
      end
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end
