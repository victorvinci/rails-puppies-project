class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  validates :booking_start, presence: true
  validates :booking_end, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending rejected accepted canceled)}
end
