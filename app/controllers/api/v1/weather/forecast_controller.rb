class Api::V1::Weather::ForecastController < ApplicationController

  def show
    render json: {test: "test"}
    #ForecastSerializer.new(Forecast.find_or_create_by(search_params))
  end


  private

  def search_params
    params.permit(:location)
  end

end
