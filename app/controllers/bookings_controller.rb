class BookingsController < ApplicationController
  def new
    redirect_to flights_path if !params[:flight_id].present?

    passengers = params[:passengers]

    # Redirect if the params Passengers does not exist or is not a integer string (eg. '1', '8', '13')
    if !passengers || !passengers.match?(/\A-?\d+\z/)
      redirect_to flights_path
    end

    passengers = passengers.to_i

    @booking = Booking.new
    passengers.times { @booking.passengers.build }
  end

  def create
  end
end
