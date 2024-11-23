class Passenger < ApplicationRecord
  belongs_to :booking

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
