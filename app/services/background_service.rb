class BackgroundService
  def initialize(location)
    @location = location
    @city = location[:city_state].split(",")[0].capitalize
  end

  def update_backgrounds
    location = Location.find_by(city_state: @location[:city_state])
    location.update(background_url: get_urls)
    location
  end

  def get_urls
    data = get_json
    urls = []
    data[:photos][:photo].each do |photo|
      urls << "https://farm#{photo[:farm]}.staticflickr.com/#{photo[:server]}/#{photo[:id]}_#{photo[:secret]}.jpg"
    end
    urls
  end

  private

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.flickr.com/services/rest/?api_key=#{ENV["FLICKR_API_KEY"]}&method=flickr.photos.search&tags=#{@city},skyline&tag_mode=all&accuracy=8&lat=#{@location[:latitude]}&long=#{@location[:longitude]}&content_type=1&has_geo=1&safe_search=1&format=json&nojsoncallback=1")
  end
end
