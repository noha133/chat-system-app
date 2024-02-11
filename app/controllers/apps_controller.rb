class AppsController < ApplicationController
  def index
    apps = App.all
    render json: apps
  end

  def show
    @application = App.find_by(token: params[:token])
    if @application
      render json: @application, status: 200
    else 
      render json: {
        error: "App Not Found"
      }
    end
  end


  def create
    @application = App.new(app_params)
    @application.token = SecureRandom.hex(16) # Generate a random hex token

    if @application.save
      render json: { token: @application.token }, status: :created
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  def update
    @application = App.find_by(token: params[:token])
    if @application.update(app_params)
      render json: @application, status: 200
    else
      render :edit
    end
  end
  
  def app_params
    params.require(:app).permit(:name)
  end
  
end
