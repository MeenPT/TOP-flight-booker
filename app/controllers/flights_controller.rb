class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:departure_airport, :arrival_airport).order(start: :asc)
  end
end
