class User < ActiveRecord::Base
  has_secure_password
  store_accessor :location
end
