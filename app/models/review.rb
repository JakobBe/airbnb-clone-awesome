class Review < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :rating, :message, presence: true
  validates :rating, inclusion: { in: [1,2,3,4,5]}
end
