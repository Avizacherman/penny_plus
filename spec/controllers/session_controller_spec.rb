require "rails_helper"

RSpec.describe SessionController, type: :controller do
  describe "Session #create" do
      context "When user logs in with valid password" do
        let :credentials do
          {username: "dude", password: "secret", full_name: "Dude McDude"}
        end


        before :each do
          user = User.create(credentials)
          post :create, credentials
        end

        it "Sets signed cookie with user ID" do
          expect(controller.current_user.id).to eq cookie.signed[:user_id]
        end
        it "Sends a JSON Response indicating proper log-in with Full Name" do
          @expected = {full_name: "Dude McDude",logged_in: true}.to_json
          expect(response).to eq @expected
        end
      end

      context "When user does not use a valid password or username" do
        let :bad_credentials do
          {username: "fake", password: "bs"}
        end

        before :each do
          post :create, bad_credentials
        end

        it "Sends an error response indicating Invalid Username or Password" do
          @expected = {error: "Invalid Username or Password"}.to_json
          expect(response).to eq @expected
        end
      end
    end

    context "User logs out, destroying their session" do
      before :each do
        delete :destroy
      end

      it "Sends a log out response to the client" do
        @expected = {logged_in: false}.to_json
        expecte(response).to eq @expected
      end
      it "Clears out the signed cookie for user_id" do
        @expected = ""
        expect(cookie.signed[:user_id]).to eq @expected
      end
    end
end
