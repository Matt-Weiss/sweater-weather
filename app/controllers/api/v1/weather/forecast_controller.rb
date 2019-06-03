class Api::V1::Weather::ForecastController < ApplicationController

  def show
    location = Location.find_or_create_by(city_state: search_params[:location])
    if location.forecast
      render json: WeatherSerializer.new(location)
    else
      get_weather(location)
      render json: WeatherSerializer.new(location)
    end
  end

  private

  def get_weather(location)
    updated_location = LocationService.new(location).parse_location
    weather = ForecastService.new(updated_location)
    weather.get_forecast
  end

  def search_params
    params.permit(:location)
  end

end
