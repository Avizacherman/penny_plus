class User < ActiveRecord::Base
  # include ReverseGeocode
  include UserTokens
  has_secure_password
  validates :password, presence: true, length: {minimum: 8}
  validates :password, confirmation: true, on: :create
  validates :username, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create
  validates :full_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :city, presence: true
  validates :state, presence: true

  reverse_geocoded_by :latitude, :longitude do |record,results|
    if geo = results.first
      record.city    = geo.city
      record.state = geo.state
    end
  end
  before_validation :reverse_geocode

  # before_validation :reverse_geocode
  # after_validation :set_access_token

  has_one :scoreboard, as: :score
  has_one :geodatum
  # store_accessor :location

  # before_validation :reverse_geocode
end
