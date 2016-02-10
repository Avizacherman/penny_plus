class SessionController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      cookies.signed[:user_id] = user.id
      render json: {full_name: user.full_name, logged_in: true}
    else
      render json: {error: "Invalid Username or Password", logged_in: false}
    end
  end

  def destroy
    cookies.signed[:user_id] = nil
    render json: {logged_in: false}
  end

end
