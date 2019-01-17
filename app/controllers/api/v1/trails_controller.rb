class Api::V1::TrailsController < ApplicationController
  before_action :find_trail, only: [:update, :show, :destroy]

  def index
    trails = Trail.all
    render json: trails
  end

  def show
    render json: trail, status: :accepted
  end

  def create
    current_user = User.find(params[:user_id])

    trail = Trail.new(trail_params)
    trail.users << current_user

    if trail.save
      render json: trail
    else
      render json: { errors: trail.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    if @trail.destroy
    render json: @trail, status: :accepted
    else
      render json: { errors: trail.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def trail_params
    params.require(:trail).permit(:trail_number)
  end

  def find_trail
    @trail = Trail.find(params[:id])
  end

end
