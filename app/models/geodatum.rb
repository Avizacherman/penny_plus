class Geodatum < ActiveRecord::Base
  belongs_to :user
  reverse_geocoded_by :lat, :lng
end
