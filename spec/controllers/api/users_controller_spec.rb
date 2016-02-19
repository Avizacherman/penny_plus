require 'rails_helper'


RSpec.describe Api::UsersController, type: :controller do
  render_views

  let :json do JSON.parse response.body end

  context "Index Route" do
    before :each do
      base_lat = Faker::Address.latitude.to_f
      base_lng = Faker::Address.longitude.to_f

      LAT_MINUTES_TO_DECIMAL_RATE = 0.0166666666667

      10.times do |i|
        user = User.new({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name})
        user.save(validate: false)
        user.geodatum.update({ lat: base_lat + (i * LAT_MINUTES_TO_DECIMAL_RATE * 0.001), lng: base_lng})
      end


      140.times do |i|
        user = User.new({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name})
        user.save(validate: false)
        user.geodatum.update({ lat: base_lat + (i * LAT_MINUTES_TO_DECIMAL_RATE), lng: base_lng})
      end



    end



    it "By default should respond with data within 1 mile of the users last known location" do
      cookies.signed[:user_id] = User.first.id

      get :index
      expect(json["users"].count).to eq 11
    end

    it "Should allow for expansion of the radius if given a distance value" do
      cookies.signed[:user_id] = User.first.id
      DISTANCE_MINUTES_TO_MILES_LAT = 1.15
      distance = 20 * DISTANCE_MINUTES_TO_MILES_LAT
      get :index, distance: distance
      expect(json["users"].count).to eq 30
    end

    it "Should give an error if there is no logged in user" do
      get :index
      err_response = {"error": "Not logged in"}.to_json
      expect(response.body).to eq err_response
    end
  end
end
