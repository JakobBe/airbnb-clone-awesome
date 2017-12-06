class User < ApplicationRecord
  has_many :flats
  has_many :bookings
  belongs_to :registration
  after_initialize :init

    def init
      self.homeowner  ||= false
    end
end
