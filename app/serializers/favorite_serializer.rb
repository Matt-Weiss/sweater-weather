class FavoriteSerializer
  # include FastJsonapi::ObjectSerializer
  attr_reader :favorites

  def initialize(locations)
    @favorites = locations.map do |location|
    current_forecast = location.forecast["currently"]
    hourly_header = location.forecast["hourly"]
    todays_forecast = location.forecast["daily"]["data"][0]

    location.forecast = {location: location.city_state,
                  current_weather: {
                               time: Time.at(current_forecast["time"]),
                     glance_summary: current_forecast["summary"],
                               icon: current_forecast["icon"],
                current_temperature: current_forecast["temperature"],
                    feels_like_temp: current_forecast["apparentTemperature"],
                           humidity: current_forecast["humidity"],
                         visibility: current_forecast["visibility"],
                           uv_index: current_forecast["uvIndex"],
                          high_temp: todays_forecast["temperatureHigh"],
                           low_temp: todays_forecast["temperatureLow"],
                      today_summary: hourly_header["summary"] }
                        }
    end
  end
end
