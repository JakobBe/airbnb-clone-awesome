class User < ApplicationRecord
  has_many :flats
  has_many :bookings
  has_many :reviews
  belongs_to :registration
  has_attachment :photo

  # validates :first_name, presence: true
  # validates :last_name, presence: true


  after_initialize :init

    def init
      self.homeowner  ||= false
    end
end
