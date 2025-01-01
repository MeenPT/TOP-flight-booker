class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  validates_associated :flight
end
