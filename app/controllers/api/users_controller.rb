class Api::UsersController < ApplicationController

  def index
    distance = params[:distance] || 1

    if(cookies.signed[:user_id])
      current_user = User.find(cookies.signed[:user_id])
      @users = User.joins(:geodatum).within(distance, origin: [current_user.geodatum.lat, current_user.geodatum.lng])
      render formats: :json
    else
      render json: {error: "Not logged in"}
    end
  end
end
