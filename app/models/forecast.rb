class Forecast
  attr_reader :forecast, :location

  def initialize(forecast, location)
    @forecast = forecast
    @location = location
  end

  def current_forecast
    current_forecast = forecast[:currently]
    hourly_header = forecast[:hourly]
    todays_forecast = forecast[:daily][:data][0]

    parsed_current_forecast = { city_state: location.city_state,
                           country: location.country,
                        currently: {
                               time: Time.at(current_forecast[:time]),
                     glance_summary: current_forecast[:summary],
                               icon: current_forecast[:icon],
                current_temperature: current_forecast[:temperature],
                    feels_like_temp: current_forecast[:apparentTemperature],
                           humidity: current_forecast[:humidity],
                         visibility: current_forecast[:visibility],
                           uv_index: current_forecast[:uvIndex],
                          high_temp: todays_forecast[:temperatureHigh],
                           low_temp: todays_forecast[:temperatureLow],
                      today_summary: hourly_header[:summary] }}
  end
  def hourly_forecast
    hourly_forecast = forecast[:hourly][:data]
    parsed_hourly_forecast = {hourly: [{
                 time: Time.at(hourly_forecast[0][:time]),
                 icon: hourly_forecast[0][:icon],
                 temp: hourly_forecast[0][:temperature]
                },
                {
                 time: Time.at(hourly_forecast[2][:time]),
                 icon: hourly_forecast[2][:icon],
                 temp: hourly_forecast[2][:temperature]
                },
                {
                 time: Time.at(hourly_forecast[4][:time]),
                 icon: hourly_forecast[4][:icon],
                 temp: hourly_forecast[4][:temperature]
                },
                {
                 time: Time.at(hourly_forecast[6][:time]),
                 icon: hourly_forecast[6][:icon],
                 temp: hourly_forecast[6][:temperature]
                },
                {
                 time: Time.at(hourly_forecast[8][:time]),
                 icon: hourly_forecast[8][:icon],
                 temp: hourly_forecast[8][:temperature]
                },
                {
                 time: Time.at(hourly_forecast[10][:time]),
                 icon: hourly_forecast[10][:icon],
                 temp: hourly_forecast[10][:temperature]
                },
                {
                 time: Time.at(hourly_forecast[12][:time]),
                 icon: hourly_forecast[12][:icon],
                 temp: hourly_forecast[12][:temperature]
                },
                {
                 time: Time.at(hourly_forecast[14][:time]),
                 icon: hourly_forecast[14][:icon],
                 temp: hourly_forecast[14][:temperature]
                  }]}
  end

  def daily_forecast
  daily_forecast = forecast[:daily][:data]
  daily_parsed_forecast = {daily: [{
                                day: Time.at(daily_forecast[1][:time]).wday,
                               icon: daily_forecast[1][:icon],
                            summary: daily_forecast[1][:summary],
               precipitation_chance: daily_forecast[1][:precipProbability] * 100,
                          high_temp: daily_forecast[1][:temperatureHigh],
                           low_temp: daily_forecast[1][:temperatureLow]
                                },
                                {
                                day: Time.at(daily_forecast[2][:time]).wday,
                               icon: daily_forecast[2][:icon],
                            summary: daily_forecast[2][:summary],
               precipitation_chance: daily_forecast[2][:precipProbability] * 100,
                          high_temp: daily_forecast[2][:temperatureHigh],
                           low_temp: daily_forecast[2][:temperatureLow]
                                },
                                {
                                day: Time.at(daily_forecast[3][:time]).wday,
                               icon: daily_forecast[3][:icon],
                            summary: daily_forecast[3][:summary],
               precipitation_chance: daily_forecast[3][:precipProbability] * 100,
                          high_temp: daily_forecast[3][:temperatureHigh],
                           low_temp: daily_forecast[3][:temperatureLow]
                                },
                                {
                                day: Time.at(daily_forecast[4][:time]).wday,
                               icon: daily_forecast[4][:icon],
                            summary: daily_forecast[4][:summary],
               precipitation_chance: daily_forecast[4][:precipProbability] * 100,
                          high_temp: daily_forecast[4][:temperatureHigh],
                           low_temp: daily_forecast[4][:temperatureLow]
                                },
                                {
                                day: Time.at(daily_forecast[5][:time]).wday,
                               icon: daily_forecast[5][:icon],
                            summary: daily_forecast[5][:summary],
               precipitation_chance: daily_forecast[5][:precipProbability] * 100,
                          high_temp: daily_forecast[5][:temperatureHigh],
                           low_temp: daily_forecast[5][:temperatureLow]
                                }]
                              }
  end
end
  # def parse_forecast
  #   current_forecast = forecast[:currently]
  #   hourly_header = forecast[:hourly]
  #   hourly_forecast = forecast[:hourly][:data]
  #   todays_forecast = forecast[:daily][:data][0]
  #   daily_forecast = forecast[:daily][:data]
  #
  #   parsed_forecast = { city_state: location.city_state,
  #                          country: location.country,
  #                       currently: {
  #                              time: Time.at(current_forecast[:time]),
  #                    glance_summary: current_forecast[:summary],
  #                              icon: current_forecast[:icon],
  #               current_temperature: current_forecast[:temperature],
  #                   feels_like_temp: current_forecast[:apparentTemperature],
  #                          humidity: current_forecast[:humidity],
  #                        visibility: current_forecast[:visibility],
  #                          uv_index: current_forecast[:uvIndex],
  #                         high_temp: todays_forecast[:temperatureHigh],
  #                          low_temp: todays_forecast[:temperatureLow],
  #                     today_summary: hourly_header[:summary] },
  #                         hourly: [{
  #                              time: Time.at(hourly_forecast[0][:time]),
  #                              icon: hourly_forecast[0][:icon],
  #                              temp: hourly_forecast[0][:temperature]
  #                             },
  #                             {
  #                              time: Time.at(hourly_forecast[2][:time]),
  #                              icon: hourly_forecast[2][:icon],
  #                              temp: hourly_forecast[2][:temperature]
  #                             },
  #                             {
  #                              time: Time.at(hourly_forecast[4][:time]),
  #                              icon: hourly_forecast[4][:icon],
  #                              temp: hourly_forecast[4][:temperature]
  #                             },
  #                             {
  #                              time: Time.at(hourly_forecast[6][:time]),
  #                              icon: hourly_forecast[6][:icon],
  #                              temp: hourly_forecast[6][:temperature]
  #                             },
  #                             {
  #                              time: Time.at(hourly_forecast[8][:time]),
  #                              icon: hourly_forecast[8][:icon],
  #                              temp: hourly_forecast[8][:temperature]
  #                             },
  #                             {
  #                              time: Time.at(hourly_forecast[10][:time]),
  #                              icon: hourly_forecast[10][:icon],
  #                              temp: hourly_forecast[10][:temperature]
  #                             },
  #                             {
  #                              time: Time.at(hourly_forecast[12][:time]),
  #                              icon: hourly_forecast[12][:icon],
  #                              temp: hourly_forecast[12][:temperature]
  #                             },
  #                             {
  #                              time: Time.at(hourly_forecast[14][:time]),
  #                              icon: hourly_forecast[14][:icon],
  #                              temp: hourly_forecast[14][:temperature]
  #                               }],
  #                           daily: [{
  #                               day: Time.at(daily_forecast[1][:time]).wday,
  #                              icon: daily_forecast[1][:icon],
  #                           summary: daily_forecast[1][:summary],
  #              precipitation_chance: daily_forecast[1][:precipProbability] * 100,
  #                         high_temp: daily_forecast[1][:temperatureHigh],
  #                          low_temp: daily_forecast[1][:temperatureLow]
  #                               },
  #                               {
  #                               day: Time.at(daily_forecast[2][:time]).wday,
  #                              icon: daily_forecast[2][:icon],
  #                           summary: daily_forecast[2][:summary],
  #              precipitation_chance: daily_forecast[2][:precipProbability] * 100,
  #                         high_temp: daily_forecast[2][:temperatureHigh],
  #                          low_temp: daily_forecast[2][:temperatureLow]
  #                               },
  #                               {
  #                               day: Time.at(daily_forecast[3][:time]).wday,
  #                              icon: daily_forecast[3][:icon],
  #                           summary: daily_forecast[3][:summary],
  #              precipitation_chance: daily_forecast[3][:precipProbability] * 100,
  #                         high_temp: daily_forecast[3][:temperatureHigh],
  #                          low_temp: daily_forecast[3][:temperatureLow]
  #                               },
  #                               {
  #                               day: Time.at(daily_forecast[4][:time]).wday,
  #                              icon: daily_forecast[4][:icon],
  #                           summary: daily_forecast[4][:summary],
  #              precipitation_chance: daily_forecast[4][:precipProbability] * 100,
  #                         high_temp: daily_forecast[4][:temperatureHigh],
  #                          low_temp: daily_forecast[4][:temperatureLow]
  #                               },
  #                               {
  #                               day: Time.at(daily_forecast[5][:time]).wday,
  #                              icon: daily_forecast[5][:icon],
  #                           summary: daily_forecast[5][:summary],
  #              precipitation_chance: daily_forecast[5][:precipProbability] * 100,
  #                         high_temp: daily_forecast[5][:temperatureHigh],
  #                          low_temp: daily_forecast[5][:temperatureLow]
  #                               }]
  #                             }
  # end
