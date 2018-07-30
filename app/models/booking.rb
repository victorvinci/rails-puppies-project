class Booking < ApplicationRecord
  belongs_to :pets
  belongs_to :users
  validates :booking_start, presence: true
  validates :booking_end, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending rejected accepted canceled)}
end
