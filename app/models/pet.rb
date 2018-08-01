class Pet < ApplicationRecord
  include PgSearch

  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings

  validates :name, presence: true
  validates :species, presence: true
  validates :address, presence: true
  # Size specified in _form for pet. All validation contained there
  validates :size, presence: true
  # Validates :details, length: { minimum: 10 }

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  pg_search_scope :main_search, against: %i(details size species)
end
