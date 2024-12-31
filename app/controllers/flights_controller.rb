class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:departure_airport, :arrival_airport).order(start: :asc)

    @flight_dates = @flights.map { |item| item.formatted_flight_date }.uniq
  end
end
