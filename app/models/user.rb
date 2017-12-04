class User < ApplicationRecord
  has_many :flats
  has_many :bookings
  belongs_to :registration
end
