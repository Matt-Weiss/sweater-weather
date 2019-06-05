class Api::V1::FavoriteController < BaseAPIController

  def create
    if valid_user?
      location = Location.find_or_create_by(city_state: params[:location])
      Favorite.find_or_create_by(user_id: session[:user_id],
                             location_id: location.id)
      render json: {success: "favorite stored!"}, status: 201
    else
      render json: {error: "Incorrect api_key"}, status: 401
    end
  end

  def index
    if valid_user?
      favorites = User.includes(:locations).find(session[:user_id]).locations
      render json:  WeatherSerializer.favorites_forecast(favorites)
    else
      render json: {error: "Incorrect api_key"}, status: 401
    end
  end

  def delete
    if valid_user?
      location = Favorite.find_by(user_id: session[:user_id], location_id: params[:location])
      location.delete
      favorites = User.includes(:locations).find(session[:user_id]).locations
      render json:  WeatherSerializer.favorites_forecast(favorites)
      #inquire about a redirect
    else
      render json: {error: "Incorrect api_key"}, status: 401
    end
  end
end
