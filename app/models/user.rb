class User < ActiveRecord::Base
  has_secure_password
  has_one :scoreboard, as: :score
  store_accessor :location
  
  before_validation :reverse_geocode
end
