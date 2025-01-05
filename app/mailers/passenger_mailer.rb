class PassengerMailer < ApplicationMailer
  default from: "flightbooker@example.com"

  def confirmation_email
    @passenger = params[:passenger]
    @flight = params[:flight]
    mail(to: @passenger.email, subject: "Booking Confirmation")
  end
end
