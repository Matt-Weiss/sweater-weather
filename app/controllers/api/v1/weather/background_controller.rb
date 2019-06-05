class Api::V1::Weather::BackgroundController < BaseAPIController

  def show
    location = Location.find_or_create_by(city_state: search_params[:location])
    if location.background_url
      render json: BackgroundSerializer.new(location)
    else
      get_background(location)
      render json: BackgroundSerializer.new(location)
    end
  end

  private

  def get_background(location)
    location = LocationService.new(location).parse_location
    background = BackgroundService.new(location)
    background.update_backgrounds
  end

  def search_params
    params.permit(:location)
  end
end
