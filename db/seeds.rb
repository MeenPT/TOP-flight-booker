iata_codes = [
  "ATL", "LAX", "ORD", "DFW", "DEN",
  "JFK", "SFO", "SEA", "MIA", "PHX",
  "CLT", "LAS", "IAH", "EWR", "MSP",
  "BOS", "DTW", "PHL", "FLL", "SAN"
]

iata_codes.each do |iata|
  Airport.find_or_create_by!(iata: iata)
end
