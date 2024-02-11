class AppsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @application = App.new(application_params)
    @application.token = SecureRandom.hex(16) # Generate a random hex token

    if @application.save
      render json: { token: @application.token }, status: :created
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end
  private
  def application_params
    params.require(:app).permit(:name)
  end
  def update
  end
end
