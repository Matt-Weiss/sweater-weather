class Api::V1::UserController < ApplicationController

  def create
    user = User.new(email: params[:email],
                 password: params[:password])
    user.save

    render json: {api_key: user.api_key}, status: 201
  end
end
