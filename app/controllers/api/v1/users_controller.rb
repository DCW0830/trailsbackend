class Api::V1::UsersController < ApplicationController

  def login
    if params[:user][:password_confirmation]
      user = User.create(new_user_params)
      if user.valid?
        render json: user, status: :accepted
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessible_entity
      end
    else
      user = User.find_by(username: params[:user][:username])
      if user && user.authenticate(params[:user][:password])
        render json: user, status: :accepted
      else
        render json: { errors: 'Failed to Log In' }, status: 400
      end
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
