class Api::V1::Weather::ForecastController < ApplicationController

  def show
    weather = Location.find_by(city_state: search_params[:location])
    if weather
      render json: weather.to_json
    else
      Forecast.new(search_params[:location])
    end
  end


  private

  def search_params
    params.permit(:location)
  end

end
