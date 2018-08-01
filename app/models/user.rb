class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pets
  has_many :bookings
 # I think this has_many through was a case of overdesigning
 # I have commented it out to make bookings and pet views work properly
 # has_many :pets, through: :bookings
end
