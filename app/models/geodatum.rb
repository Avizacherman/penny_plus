class Geodatum < ActiveRecord::Base
  belongs_to :user
  act_as_mapable
end
