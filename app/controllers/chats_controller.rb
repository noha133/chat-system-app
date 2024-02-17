
class ChatsController < ApplicationController
  def index
    application = App.find_by(token: params[:token])
    if application
      chats = application.chats
      chats_number = chats.map { |chat| { chat_number: chat.chat_number, messages_count: chat.messages_count} }
      render json: {chats_number: chats_number} 

    else
      render json: { error: 'App not found' }, status: :not_found
    end
  end

  def show
  end

  def create
    token = params[:token]
    text = params[:text]
    application = App.find_by(token: token)
    if application
      key = application.id
      key = key.to_s
      chat_number = ::REDIS.incr(key)
      ChatJob.perform_async(chat_number, application.id)
      render json: {chat_number: chat_number}, status: :created
    else
      render json: { error: 'App not found' }, status: :not_found
    end
  end

  def update
  end
end
