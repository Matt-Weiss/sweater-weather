class BaseAPIController < ActionController::API

  def valid_user?
    user = User.find(session[:user_id])
    user.api_key == params[:api_key]
  end
end
