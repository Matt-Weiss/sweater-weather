class Api::V1::FavoriteController < BaseAPIController

  def create
    if valid_user?
      favorite = Favorite.create(user_id: session[:user_id],
                             location_id: params[:location])
      render json: {success: "favorite stored!"}, status: 201
    else
      render json: {error: "Incorrect api_key"}, status: 401
    end
  end

  def index
    if valid_user?
      favorites = User.includes(:locations).find(session[:user_id]).locations
      render json:  FavoriteSerializer.new(favorites).favorites
    else
      render json: {error: "Incorrect api_key"}, status: 401
    end
  end

  def delete
    if valid_user?
      location = Favorite.find_by(user_id: session[:user_id], location_id: params[:location])
      location.delete
      favorites = User.includes(:locations).find(session[:user_id]).locations
      render json:  FavoriteSerializer.new(favorites).favorites
      #inquire about a redirect
    else
      render json: {error: "Incorrect api_key"}, status: 401
    end
  end
end