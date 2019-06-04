class Api::V1::SessionController < BaseAPIController

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {api_key: user.api_key}, status: 200
    end
  end
end
