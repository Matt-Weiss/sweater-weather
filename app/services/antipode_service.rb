class AntipodeService

  def initialize(location)
    @location = location
  end

  def find_antipode
    data = get_json
    # binding.pry
  end

  private

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{@location.latitude}&long=#{@location.longitude}") do |f|
      f.headers['api_key'] = 'oscar_the_grouch'
      f.adapter Faraday.default_adapter
    end
  end

end
