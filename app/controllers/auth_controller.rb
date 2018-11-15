class AuthController < ApplicationController

  def create
    @user = User.find_by(username: params["username"])

    if @user && @user.authenticate(params[:password])
      token = encode_token({id: @user.id})
      render json: {jwt: token}
    else
      render json: {error:'User/Password is invalid'}, status: 401
    end
  end


  def show
    decoded = decoded_token
    @user = User.find_by(id: decoded[0]["id"])

    if @user
      render json: {username: @user.username, id: @user.id}
    else
      render json: {error: 'Invalid token'}, status: 401
    end

  end

end
