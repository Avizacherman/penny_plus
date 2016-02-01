class User < ActiveRecord::Base
  # include ReverseGeocoder
  has_secure_password
  validates :location, location_hash: true
  validates :password, confirmation: true
  validates :username, presence: true
  validates :password_confirmation, presence: true
  validates :full_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  has_one :scoreboard, as: :score
  store_accessor :location

  # before_validation :reverse_geocode
end
