class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render
  end
end
