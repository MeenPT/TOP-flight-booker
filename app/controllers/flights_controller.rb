class FlightsController < ApplicationController
  def index
    airport_codes =  Airport.pluck(:iata, :id)
    @airport_options = airport_codes.unshift([ "Any", nil ])

    flight_dates = Flight.pluck(:depart_at).map { |item| [ item.strftime("%d/%m/%Y"), item.to_date ] }
    @flight_date_options = flight_dates.unshift([ "Any", nil ])

    @flights = Flight.all.includes(:departure_airport, :arrival_airport)
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
