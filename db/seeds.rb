iata_codes = [ "ATL", "PEK", "LHR", "ORD", "LAX", "HND", "CDG", "DFW", "FRA", "DXB", "JFK", "SIN", "AMS", "IST", "SFO" ]

airports = iata_codes.map { |iata| Airport.create(iata: iata) }


def random_start
  now = DateTime.now
  next_year = now + 365
  random_timestamp = rand(now.to_time.to_i..next_year.to_time.to_i)
  Time.at(random_timestamp).to_datetime
end

def random_duration
  hours = rand(1..15).hours
  minutes = rand(1..59).minutes

  (hours + minutes).iso8601
end

airports.each do |airport|
  arrival_airport_option = airports.reject { |item| item == airport }

  airport.departing_flights.create([
    {
      start: random_start,
      duration: random_duration,
      arrival_airport_id: arrival_airport_option.sample.id
    },
    {
      start: random_start,
      duration: random_duration,
      arrival_airport_id: arrival_airport_option.sample.id
    }
  ])
end
