class Api::V1::UserTrailsController < ApplicationController

  def index
    @userTrails = UserTrail.all
    render json: @userTrails
  end
end
