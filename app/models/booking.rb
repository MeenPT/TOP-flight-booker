class Booking < ApplicationRecord
  belongs_to :flight
  validates_associated :flight

  has_many :passengers, inverse_of: :booking, dependent: :destroy
  accepts_nested_attributes_for :passengers, allow_destroy: true

  validates :passengers, presence: true
end
