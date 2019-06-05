class Api::V1::SessionController < BaseAPIController

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {api_key: user.api_key}, status: 200
    else
      render json: {error: "invalid email or password"}, status: 401
    end
  end
end
