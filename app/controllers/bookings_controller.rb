class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

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
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: "Booked flight success."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.expect(booking: [
      :flight_id,
      passengers_attributes: [ [ :id, :name, :email ] ]
    ])
  end
end
