class LocationService

  def initialize(location)
    @location = location
  end

  def parse_location
    location_info = get_json[:results][0]
    @location.update(country: location_info[:address_components].last[:long_name],
                    latitude: location_info[:geometry][:location][:lat].to_s,
                   longitude: location_info[:geometry][:location][:lng].to_s)
    @location
  end

  def get_json
    response ||= conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV["GOOGLE_API_KEY"]}&address=#{@location[:city_state]}")
  end

end
