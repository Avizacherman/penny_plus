require 'rails_helper'

RSpec.describe Scoreboard, type: :model do
  context "User creates a new Scoreboard each time a New User is created" do
    before :each do
      @user = User.new({username: "Bob", password: "Imawinner", password_confirmation: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", first_name: "Bob", last_name: "Burgerski", email: "bob@burger.com"})
      @user.save
    end

    it "Most recent Scoreboard should be the one associated with the newly created user" do
      sample_scoreboard = Scoreboard.last
      expect(@user.scoreboard).to eq sample_scoreboard
    end
  end
end
