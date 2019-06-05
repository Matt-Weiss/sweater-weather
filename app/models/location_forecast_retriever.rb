class LocationForecastRetriever
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_forecast
    forecast = ForecastService.new.get_json(location)
    #when I made get_json a class method conn stopped working
    Forecast.new(forecast, location)
  end
end
