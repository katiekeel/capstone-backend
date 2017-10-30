class Api::V1::TanksController < ApplicationController

  def index
    render json: Tank.all
  end

end
