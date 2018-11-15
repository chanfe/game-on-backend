class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create(strong_params)
    byebug
    if @user.valid?
      render json: { user: UserSerializer.new(@user) , jwt: @token}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    @user = User.find(params[:id])
    unless @user.nil?
      @user.update(strong_params)
      render json: @user
    else
      render json: { error: "User not Found!" }, status: 404
    end
  end

  def destroy
    @user = User.find(params[:id])
    unless @user.nil?
      @user.destroy
      render json: @user
    else
      render json: { error: "User not Found!" }, status: 404
    end
  end

  private
  def strong_params
    params.require(:user).permit(:id, :name, :username, :password, :first_ending, :second_ending, :secret_place, :secret_login, :max_score_v1, :max_score_v2)

  end
end
