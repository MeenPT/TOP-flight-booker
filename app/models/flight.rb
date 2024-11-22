class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :bookings

  def readable_duration
    hours = self.duration.parts[:hours]
    minutes = self.duration.parts[:minutes]

    "#{hours} H #{minutes} M"
  end
end
