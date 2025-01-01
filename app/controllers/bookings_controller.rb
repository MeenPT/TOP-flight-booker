class BookingsController < ApplicationController
  def new
    redirect_to flights_path if !params[:flight_id].present? || !params[:passengers].present?

    @booking = Booking.new
  end
end
