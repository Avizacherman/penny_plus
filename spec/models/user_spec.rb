require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validators" do
    it "should only save with presence of a usernname" do

    end
    it "should only save with presence of a password" do

    end
    it "should only save with presence of a password_confirmation" do

    end
    it "should only save with if the username is unique" do

    end
    it "should only create with presence of a full name" do

    end

  end

  context "Active Record Callbacks" do
    it "should automatically combine first_name and last_name into full_name"
  end
end