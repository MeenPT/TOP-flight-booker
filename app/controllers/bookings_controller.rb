class BookingsController < ApplicationController
  def new
    @booking = Booking.new

    redirect_to root_path unless params[:flight_id].present?

    @flight = Flight.find(params[:flight_id])
  end

  def create
  end
end
