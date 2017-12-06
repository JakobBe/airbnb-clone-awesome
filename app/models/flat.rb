class Flat < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  belongs_to :user
  has_many :bookings
end
