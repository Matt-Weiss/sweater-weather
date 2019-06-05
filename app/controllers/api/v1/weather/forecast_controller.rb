class Api::V1::Weather::ForecastController < BaseAPIController

  def show
    location = Location.find_or_create_by(city_state: search_params[:location])
    forecast = Rails.cache.fetch("location-#{location.id}-forecast", expires_in: 15.minutes) do
      get_weather(location)
    end

    render json: WeatherSerializer.full_forecast(forecast)
  end

  private

  def get_weather(location)
    location = LocationService.new(location).parse_location
    weather = LocationForecastRetriever.new(location)
    weather.get_forecast
  end

  def search_params
    params.permit(:location)
  end

end
