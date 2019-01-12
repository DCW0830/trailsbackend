class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:login]

  def index
    @users = User.all
    render json: @users, status: :accepted
  end

  def create
      @user = User.create(new_user_params)
    if @user.valid?
      render json: @user, status: :accepted
    else
      render json: { errors: @user.error.full_messages }, status: :unprocessible_entity
    end
  end

  def login
    if @user && @user.authenticate(params[:user][:username])
      render json: { current: user }
    else
      render json:  { errors: @user.error.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    render json: get_current_user, status: :accepted
  end

  private

  def find_user
    @user = User.find(params[:user][:username])
  end

  def new_user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation
    )
  end

  def user_params
    params.permit(:username)
  end


end
