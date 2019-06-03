class LocationService

  def initialize(location)
    @location = location
  end

  def parse_location
    location_info = get_json[:results][0]
    @location.update(country: location_info[:address_components].last[:long_name],
                    latitude: location_info[:geometry][:location][:lat].to_s,
                   longitude: location_info[:geometry][:location][:lng].to_s,
           formatted_address: location_info[:formatted_address])
    @location
  end

  def antipode_data
    location_info = get_json[:results][0]
    city_state = location_info[:address_components].first[:long_name]
    country = location_info[:address_components].last[:long_name]
    formatted_address = location_info[:formatted_address]

    Location.create(city_state: city_state,
             formatted_address: formatted_address,
                       country: country,
                      latitude: @location[:lat],
                     longitude: @location[:long])
  end

  def get_json
    response ||= conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    if @location[:city_state]
      Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV["GOOGLE_API_KEY"]}&address=#{@location[:city_state]}")
    else
      Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV["GOOGLE_API_KEY"]}&latlng=#{@location[:lat]},#{@location[:long]}")
    end
  end

end
