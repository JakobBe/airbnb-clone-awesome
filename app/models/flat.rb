class Flat < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :location, :price, :description, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }

  has_attachment :photo

end
