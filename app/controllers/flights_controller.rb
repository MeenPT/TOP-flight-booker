class FlightsController < ApplicationController
  def index
    @flights = Flight.all.includes(:departure_airport, :arrival_airport)
    @airport_options = Airport.pluck(:iata, :id)
    @flight_date_options = Flight.pluck(:depart_at).map { |item| [ item.strftime("%d/%m/%Y"), item.to_date ] }
  end
end
