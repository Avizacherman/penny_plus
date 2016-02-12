class User < ActiveRecord::Base
  # include ReverseGeocode
  include UserTokens
  has_secure_password

  validates :password, presence: true, length: {minimum: 8}
  validates :password, confirmation: true, on: :create
  validates :username, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :city, presence: true
  validates :state, presence: true

  after_create :initialize_geodatum

  has_one :scoreboard, as: :score
  has_one :geodatum
  # store_accessor :location

  def initialize_geodatum
    self.build_geodatum({lat: 0, lng: 0})
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
