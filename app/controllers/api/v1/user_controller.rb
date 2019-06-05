class Api::V1::UserController < BaseAPIController

  def create
    user = User.new(email: params[:email],
                 password: params[:password])

    if user.save
      render json: {api_key: user.api_key}, status: 201
    else
      render json: {error: "Invalid email/email already in use"}, status: 401
    end
  end
end
