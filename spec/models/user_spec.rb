require 'rails_helper'

RSpec.describe User, type: :model do
  context "Built In Validators" do
    it "should only save with presence of a username" do
      user = User.create({password: "Imawinner", password_confirmation: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", full_name: "Bob Burgerski", email: "bob@burger.com"})
      expect(user).to_not be_valid
    end

    it "should only save with presence of a password, unless there is an access token" do
      user = User.create({username: "Bob", password_confirmation: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", full_name: "Bob Burgerski", email: "bob@burger.com"})
      expect(user).to_not be_valid

    end

    it "should require the password is at least 8 characters" do
      user = User.create({username: "Bob", password: "Imaw", password_confirmation: "Imaw", city: "New York", state: "NY", phone: "555-555-5555", full_name: "Bob Burgerski", email: "bob@burger.com"})
      expect(user).to_not be_valid

    end

    it "should require presence of a password confirmation when creating a new user" do
      user = User.create({username: "Bob", password: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", full_name: "Bob Burgerski", email: "bob@burger.com"})
      expect(user).to_not be_valid

    end

    it "should require the password confirmation to match when creating a new user" do
      user = User.create({username: "Bob", password: "Imawinner", password_confirmation: "Imaloser", city: "New York", state: "NY", phone: "555-555-5555", full_name: "Bob Burgerski", email: "bob@burger.com"})
      expect(user).to_not be_valid

    end

    it "should only save with if the username is unique" do
      user = User.create({username: "Bob", password: "Imawinner", password_confirmation: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", full_name: "Bob Burgerski", email: "bob@burger.com"})
      user_two = User.create({username: "Bob", password: "Imawinner", password_confirmation: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", full_name: "Bob Burgerski", email: "bob@burger.com"})
      expect(user_two).to_not be_valid
    end

    it "should only save with presence of a full name" do
      user = User.create({username: "Bob", password: "Imawinner", password_confirmation: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", email: "bob@burger.com"})
      expect(user).to_not be_valid
    end

    it "should only save with presence of a phone number "do
    user = User.create({username: "Bob", password: "Imawinner", password_confirmation: "Imawinner", city: "New York", state: "NY", full_name: "Bob Burgerski", email: "bob@burger.com"})
    expect(user).to_not be_valid
    end

    it "should only save with presence of an e-mail" do
      user = User.create({username: "Bob", password: "Imawinner", password_confirmation: "Imawinner", city: "New York", state: "NY", phone: "555-555-5555", full_name: "Bob Burgerski"})
      expect(user).to_not be_valid
    end
  end


  context "Active Record Callbacks" do
    it "should automatically combine first_name and last_name into full_name" do

    end

  end
end
