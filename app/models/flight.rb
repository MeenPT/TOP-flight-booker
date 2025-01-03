class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings

  def formatted_flight_date
    start.strftime("%Y-%m-%d")
  end

  def formatted_flight_time
    start.strftime("%I:%M %p")
  end
end
