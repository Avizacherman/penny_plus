class Api::UserController < ApplicationController
  def index
    @users = User.all
    render
  end
end
