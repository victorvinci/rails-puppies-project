class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_one :review
  validates :booking_start, presence: true
  validates :booking_end, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending rejected accepted canceled)}

  def parse_dates(start_date, end_date)
    self.booking_start = DateTime.strptime(start_date, "%m/%d/%Y %k:%M %p") if start_date.present?
    self.booking_end = DateTime.strptime(end_date, "%m/%d/%Y %k:%M %p") if end_date.present?
  end

end
