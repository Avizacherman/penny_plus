class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render formats: :json
  end
end
