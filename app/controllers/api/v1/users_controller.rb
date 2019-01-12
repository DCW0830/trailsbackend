class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: :accepted
  end

  def create
      @user = User.create(new_user_params)
    if @user.valid?
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      render json: @user, status: :accepted
    else
      render json: { errors: 'Failed to Log In' }, status: 400
    end
  end

  private

  def new_user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation
    )
  end

end
