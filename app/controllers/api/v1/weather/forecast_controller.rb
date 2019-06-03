class Api::V1::Weather::ForecastController < ApplicationController

  def show
    location = Location.find_or_create_by(city_state: search_params[:location])
    if location.forecast
      render json: WeatherSerializer.new(location)
    else
      location = get_weather(search_params[:location])
      render json: WeatherSerializer.new(location)
    end
  end

  private

  def get_weather(location)
    location_info = LocationService.new(location).parse_location
    weather = ForecastService.new(location_info)
    weather.get_forecast
  end

  def search_params
    params.permit(:location)
  end

end
