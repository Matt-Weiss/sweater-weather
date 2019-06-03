class ForecastService

  def initialize(location)
    @location = location
    @lat_long = "#{location[:latitude]},#{location[:longitude]}"
  end

  def get_forecast
    location = Location.find_by(city_state: @location[:city_state])
    location.update(country: @location[:country],
                   latitude: @location[:latitude],
                  longitude: @location[:longitude],
                   forecast: get_json)
    location
  end

  def get_json
    response ||= conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV["DARK_SKY_API_KEY"]}/#{@lat_long}")
  end



end
