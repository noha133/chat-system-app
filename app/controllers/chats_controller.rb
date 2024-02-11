class ChatsController < ApplicationController
  def index
    application = App.find_by(token: params[:token])
    if application
      chats = application.chats
      chats_number = chats.map { |chat| { chat_number: chat.chat_number} }
      render json: {chats_number: chats_number} 

    else
      render json: { error: 'App not found' }, status: :not_found
    end
  end

  def show
  end

  def create
    application = App.find_by(token: params[:token])
    if application
      chat_number = application.chats.count + 1
      chat = Chat.new({chat_number: chat_number,app_id: application.id})
      if chat.save
        render json: { chat_number: chat_number }, status: :created
      else
        render json: chat.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'App not found' }, status: :not_found
    end
  end

  def update
  end
end
