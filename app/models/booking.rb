class Booking < ApplicationRecord
  belongs_to :flight

  validates_associated :flight
end
