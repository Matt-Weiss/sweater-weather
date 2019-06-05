class ForecastService

  def get_json(location)
    lat_long = "#{location.latitude},#{location.longitude}"
    response = conn.get "#{lat_long}"
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://api.darksky.net/forecast/#{ENV["DARK_SKY_API_KEY"]}/")
  end



end
