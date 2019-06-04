class Api::V1::FavoriteController < BaseAPIController

  def create
    user = User.find(session[:user_id])
    if user.api_key == params[:api_key]
      favorite = Favorite.create(user_id: user.id,
                             location_id: params[:location])
      render json: {success: "favorite stored!"}, status: 201
    else
      render json: {error: "Incorrect api_key"}, status: 401
    end
  end

end
