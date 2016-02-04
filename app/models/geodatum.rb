class Geodatum < ActiveRecord::Base
  belongs_to :user
  acts_as_mapable
end
