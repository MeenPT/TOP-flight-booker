class Airport < ApplicationRecord
  validates :iata, presence: true, uniqueness: true
end
