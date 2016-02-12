class Api::GeodatumController < ApplicationController

  def update
    geodata = Geodatum.find_by(:user_id => cookies.signed[:user_id])
    geodata.update(geo_params)
  end

  private

    def geo_params
      params.permit(:lat, :lng)
    end

end
