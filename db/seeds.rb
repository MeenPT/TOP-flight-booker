iata_codes = [
  "ATL", "LAX", "ORD", "DFW", "DEN",
  "JFK", "SFO", "SEA", "MIA", "PHX",
  "CLT", "LAS", "IAH", "EWR", "MSP",
  "BOS", "DTW", "PHL", "FLL", "SAN"
]

airports = iata_codes.map do |iata|
  Airport.find_or_create_by!(iata: iata)
end

def random_flight_duration
  hours = rand(1...15).hours
  minutes = rand(1...59).minutes

  (hours + minutes).iso8601
end

def random_flight_start
  now = DateTime.now
  next_year = now + 365 # 365 days from now
  random_timestamp = rand(now.to_time.to_i..next_year.to_time.to_i)
  Time.at(random_timestamp).to_datetime
end

airports.each do |airport|
  destinations = airports.reject { |item| item == airport }

  airport.departing_flights.create([
    {
      start: random_flight_start,
      duration: random_flight_duration,
      arrival_airport_id: destinations.sample.id
    },
    {
      start: random_flight_start,
      duration: random_flight_duration,
      arrival_airport_id: destinations.sample.id
    }
  ])
end
