class Pet < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "owner_id"
  has_many :bookings
  validates :name, presence: true
  validates :species, presence: true
  validates :address, presence: true
  validates :size, inclusion: { in: ("microscopic", "small", "medium", "large", "extra-large", "monster-sized"),
    message: "Not a valid size" }
  validates :details, length: { minimum: 30 }
end
