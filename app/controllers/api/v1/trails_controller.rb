class Api::V1::TrailsController < ApplicationController
  before_action :find_trail, only: [:update, :show]

  def index
    @trails = Trail.all
    render json: @trails
  end

  def show
    render json: @trail, status: :accepted
  end

  def new
    @trail = Trail.new
  end

  def update
    @trail.update(trail_params)
    if @trail.save
      render json: @trail, status: :accepted
    else
      render json: { errors: @trail.error.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def trail_params
    params.permit(:trail_number)
  end

  def find_trail
    @trail = Trail.find(params[:id])
  end
end
