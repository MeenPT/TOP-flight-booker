class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:arrival_airport, :departure_airport).order(created_at: :desc)
  end
end
