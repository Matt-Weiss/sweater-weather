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

end
