class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_one :review
  validates :booking_start, presence: true
  validates :booking_end, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending rejected accepted canceled)}
end
