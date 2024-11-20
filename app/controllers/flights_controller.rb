class FlightsController < ApplicationController
  def index
    airport_codes =  Airport.pluck(:iata, :id)
    @airport_options = airport_codes.unshift([ "Any", nil ])

    flight_dates = Flight.pluck(:depart_at).map { |item| [ item.strftime("%d/%m/%Y"), item.to_date ] }
    @flight_date_options = flight_dates.unshift([ "Any", nil ])

    @flights = Flight.all.includes(:departure_airport, :arrival_airport)

    if params[:from].present?
      @flights = @flights.where(departure_airport_id: params[:from])
    end

    if params[:to].present?
      @flights = @flights.where(arrival_airport_id: params[:to])
    end

    if params[:depart_date].present?
      day_begin = DateTime.parse(params[:depart_date]).beginning_of_day
      day_end = DateTime.parse(params[:depart_date]).end_of_day

      @flights = @flights.where(depart_at: day_begin...day_end)
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
