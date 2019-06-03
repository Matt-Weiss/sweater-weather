class Api::V1::Weather::AntipodeController < ApplicationController

  def show
    location = Location.find_or_create_by(city_state: search_params[:loc])
    weather = get_antipode_weather(location)
    render json: AntipodeSerializer.new(weather, {params: {original_location: location}})
  end


  private

  def search_params
    params.permit(:loc)
  end

  def get_antipode(location)
    location = LocationService.new(location).parse_location
    antipode = AntipodeService.new(location)
    antipode.find_antipode
  end

  def get_antipode_weather(location)
    weather = ForecastService.new(get_antipode(location))
    weather.get_forecast
  end
end
