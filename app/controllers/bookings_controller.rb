class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    redirect_to root_path if !params[:flight_id].present?

    @flight = Flight.find(params[:flight_id])

    @num_passengers = params[:passsengers].present? ? params[:passsengers].to_i : 1

    @booking = Booking.new
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to root_path, notice: "Booking was successfully created!"
    else
      @flight = Flight.find(booking_params[:flight_id])
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :id, :name, :email, :_destroy ])
  end
end
