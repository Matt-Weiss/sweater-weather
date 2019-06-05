class WeatherSerializer

  def self.full_forecast(forecast)
    {data:[forecast.current_forecast,
    forecast.hourly_forecast,
    forecast.daily_forecast]}
  end

  def self.favorites_forecast(locations)
    @favorites = locations.map do |location|
      forecast = Rails.cache.fetch("location-#{location.id}-forecast", expires_in: 15.minutes) do
        location = LocationService.new(location).parse_location
        weather = LocationForecastRetriever.new(location)
        weather.get_forecast
      end
      forecast.current_forecast
    end
  end
end
