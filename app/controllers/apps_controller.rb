class AppsController < ApplicationController
  def index
    apps = App.all
    if apps 
      apps = apps.map { |app| { app_name: app.name, chats_count: app.chats_count, created_at: app.created_at}}
      render json: apps, status: 200
    end
  end

  def show
    app = App.find_by(token: params[:token])
    if app
      render json: {app_name: app.name, chats_count: app.chats_count, created_at: app.created_at}, status: 200
    else 
      render json: {
        error: "App Not Found"
      }
    end
  end


  def create
    if params[:name]
      @application = App.new(name: params[:name])
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
    app = App.find_by(token: params[:token])
    if app && app.update(app_params)
      render json: {app_name: app.name, chats_count: app.chats_count, created_at: app.created_at}, status: 200
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
