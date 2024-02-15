class AppsController < ApplicationController
  def index
    apps = App.all
    if apps 
      apps = apps.map { |app| { app_name: app.name, chats_count: app.chats_count, created_at: app.created_at}}
      render json: apps, status: 200
    end
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
    if params[:name]
      @application = App.new(app_params)
      @application.token = SecureRandom.hex(16) # Generate a random hex token

      if @application.save
        render json: { token: @application.token }, status: :created
      else
        render json: @application.errors, status: :unprocessable_entity
      end
    else 
      render json: {error: "Please enter application name"}, status: :unprocessable_entity
    end

  end

  def update
    @application = App.find_by(token: params[:token])
    if @application.update(app_params)
      render json: @application, status: 200
    else
      render json: {
        error: "App Not Found"
      }
    end
  end
  
  def app_params
    params.require(:app).permit(:name)
  end
  
end
