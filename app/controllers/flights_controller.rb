class FlightsController < ApplicationController
  def index
    filter_condition = {}

    if params[:departure_airport].present?
      filter_condition[:departure_airport_id] = params[:departure_airport]
    end

    if params[:arrival_airport].present?
      filter_condition[:arrival_airport_id] = params[:arrival_airport]
    end

    if params[:date].present?
      date = Date.parse(params[:date])

      filter_condition[:start] = (date.beginning_of_day)..(date.end_of_day)
    end

    @flights = Flight.where(filter_condition).includes(:departure_airport, :arrival_airport).order(start: :asc)

    @flight_dates = Flight.pluck(:start).map { |item| item.strftime("%Y-%m-%d") }
  end
end
