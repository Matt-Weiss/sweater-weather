class Api::V1::Weather::AntipodeController < ApplicationController

  def show
    location = Location.find_or_create_by(city_state: search_params[:loc])
    get_antipode(location)
  end


  private

  def search_params
    params.permit(:loc)
  end

  def get_antipode(location)
    location = LocationService.new(location).parse_location
    binding.pry
  end
end
