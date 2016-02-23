class Api::GeodataController < ApplicationController

  def update
    if cookies.signed[:user_id]
      geodata = Geodatum.find_by(:user_id => cookies.signed[:user_id])
      geodata.update(geo_params)
      render json: {data: geodata}
    else
      render json: {error: "Not Logged In"}
    end
  end

  private

    def geo_params
      params.permit(:lat, :lng)
    end

end
