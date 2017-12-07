class User < ApplicationRecord
  has_many :flats
  has_many :bookings
  has_many :reviews
  belongs_to :registration
  has_attachment :photo

  after_initialize :init

    def init
      self.homeowner  ||= false
    end
end
