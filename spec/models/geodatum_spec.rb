require 'rails_helper'

RSpec.describe Geodatum, type: :model do
  context "User creates a new Geodatum each time a New User is created" do
    before :each do
      @user = User.new({username: "Bob", password: "Imawinner", password_confirmation: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", first_name: "Bob", last_name: "Burgerski", email: "bob@burger.com"})
      @user.save
    end

    it "Most recent Geodatum should be the one associated with the newly created user" do
      sample_geodatum = Geodatum.last
      expect(@user.geodatum).to eq sample_geodatum
    end

  end
end
