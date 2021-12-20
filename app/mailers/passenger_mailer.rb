class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def confirmation_email(recipient)
    @booking = params[:booking]
    @flight = @booking.flight
    @booking_url = url_for(@booking)
    @passenger = recipient
    mail(to: @passenger.email, subject: 'Your flight booking has been confirmed')
  end
end
