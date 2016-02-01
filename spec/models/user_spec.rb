require 'rails_helper'

RSpec.describe User, type: :model do
  context "Built In Validators" do
    it "should only save with presence of a username" do

    end
    it "should only save with presence of a password" do

    end

    it "should only save if the password is at least 8 characters" do

    end

    it "should only save with presence of a password_confirmation" do

    end
    it "should only save with if the username is unique" do

    end
    it "should only save with presence of a full name" do

    end

    it "should only save with presence of a phone number "do

    end

    it "should only save if the phone number is formatted in proper format" do

    end

    it "should only save with presence of an e-mail" do

    end

    it "should only save if the e-mail is formatted in proper format" do

    end



  end

  context "Custom Validator: LocationHashValidator" do
    it "should require location to be of the class Hash" do
      testUser = User.create({username: "bob", password: "heyyouguys", password_confirmation: "heyyouguys", phone: "516-555-5555", email: "bob@bob.com", full_name: "bob bobson"})
      expect testUser.to_not be_valid
    end

    it "should not allow a location hash with anything but two values" do
      testUser = User.create({username: "bob", password: "heyyouguys", password_confirmation: "heyyouguys", phone: "516-555-5555", email: "bob@bob.com", full_name: "bob bobson"})
      expect testUser.to_not be_valid
    end

    it "should require both a city and a state key within the location hash" do
      testUser = User.create({username: "bob", password: "heyyouguys", password_confirmation: "heyyouguys", phone: "516-555-5555", email: "bob@bob.com", full_name: "bob bobson"})
      expect testUser.to_not be_valid
    end

    it "should require that both city and state be of the class String" do
      testUser = User.create({username: "bob", password: "heyyouguys", password_confirmation: "heyyouguys", phone: "516-555-5555", email: "bob@bob.com", full_name: "bob bobson"})
      expect testUser.to_not be_valid
    end

  end

  context "Active Record Callbacks" do
    it "should automatically combine first_name and last_name into full_name" do

    end

    it "should translate lat and lng into a city and state" do

    end

  end
end
