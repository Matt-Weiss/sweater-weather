class LocationService

  def initialize(location)
    @location = location
  end

  def parse_location
    location_detail = {}
    location_info = get_json[:results][0]
    location_detail[:city_state] = "#{location_info[:address_components][0][:short_name].downcase},#{location_info[:address_components][2][:short_name].downcase}"
    location_detail[:country] = location_info[:address_components][3][:long_name]
    location_detail[:latitude] = location_info[:geometry][:location][:lat].to_s
    location_detail[:longitude] = location_info[:geometry][:location][:lng].to_s
    location_detail
  end

  def get_json
    response ||= conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV["GOOGLE_API_KEY"]}&address=#{@location}")
  end

end
