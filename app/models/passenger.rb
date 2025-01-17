class Passenger < ApplicationRecord
  belongs_to :booking

  validates_associated :booking
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
