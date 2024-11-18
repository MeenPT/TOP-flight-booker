airports_data = [
  {
    iata: "ATL",
    name: "Hartsfield–Jackson Atlanta International Airport",
    location: "Atlanta, Georgia",
    country: "United States"
  },
  {
    iata: "DXB",
    name: "Dubai International Airport",
    location: "Garhoud, Dubai, Dubai",
    country: "United Arab Emirates"
  },
  {
    iata: "LHR",
    name: "Heathrow Airport",
    location: "Hillingdon, London",
    country: "United Kingdom"
  },
  {
    iata: "HND",
    name: "Tokyo Haneda Airport",
    location: "Ōta, Tokyo",
    country: "Japan"
  },
  {
    iata: "BKK",
    name: "Suvarnabhumi Airport",
    location: "Racha Thewa, Bangkok metro",
    country: "Thailand"
  }
]

airports = Airport.create(airports_data)

def random_time(start_time = DateTime.now, end_time = (DateTime.now + 1.years))
  start_timestamp = start_time.to_i
  end_timestamp = end_time.to_i

  random_timestamp = rand(start_timestamp...end_timestamp)

  Time.at(random_timestamp).to_datetime
end

def random_duration
  hours = rand(1...15).hours
  minutes = rand(1...59).minutes

  (hours + minutes).iso8601
end

airports.each do |airport|
  destination_options = airports.reject { |item| item == airport }

  Flight.create([
    {
      departure_airport_id: airport.id,
      arrival_airport_id: destination_options.sample.id,
      depart_at: random_time,
      duration: random_duration
    },
    {
      departure_airport_id: airport.id,
      arrival_airport_id: destination_options.sample.id,
      depart_at: random_time,
      duration: random_duration
    }
  ])
end
