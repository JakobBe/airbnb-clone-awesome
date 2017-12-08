class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :date, presence: true
  validates :nights, presence: true
end
