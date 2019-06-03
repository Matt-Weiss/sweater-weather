class AntipodeService

  def initialize(location)
    @location = location
  end

  def find_antipode
    lat = get_json[:data][:attributes][:lat]
    long = get_json[:data][:attributes][:long]
    antipode_location = LocationService.new({lat: lat, long: long})
    antipode_location.antipode_data
  end

  def get_json
    response ||= conn.get
    JSON.parse(response.body, symbolize_names: true)
  end
  private

  def conn
    Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{@location.latitude}&long=#{@location.longitude}") do |f|
      f.headers['api_key'] = 'oscar_the_grouch'
      f.adapter Faraday.default_adapter
    end
  end

end
