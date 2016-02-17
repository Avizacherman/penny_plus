require 'rails_helper'
require 'api/users_controller'

module Api

RSpec.describe Api::UsersController, type: :controller do
  context "Index Route" do
    before :each do
      base_lat = Faker::Address.latitude.to_f
      base_lng = Faker::Address.longitude.to_f

      LAT_MINUTES_TO_DECIMAL_RATE = 0.0166666666667

      140.times do |i|
        user = User.new({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name})
        user.save(validate: false)
        user.geodatum.update({ lat: base_lat + (i * LAT_MINUTES_TO_DECIMAL_RATE / 2).floor, lng: base_lng})
      end

      cookies.signed[:user_id] = User.first.id
    end

    it "By default should respond with data within 1 mile of the users last known location" do
      get :index
      response_count = response.body.count
      expect(response_count).to eq 20
    end

    it "Should allow for expansion of the radius if given a distance value" do

    end
  end
end
end
