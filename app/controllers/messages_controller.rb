class MessagesController < ApplicationController
    def create
      token = params[:token]
      chat_number = params[:chat_number]
      text = params[:text]
      application = App.find_by(token: token)
      if application
          chat = Chat.find_by(app: application ,chat_number: chat_number)
          if chat
            chat_id = chat.id
            chat_id = chat_id.to_s
            key = "chat" + chat_id
            message_number = ::REDIS.incr(key)
            MessageJob.perform_async(message_number,chat.id, text)
            render json: { message_number: message_number }, status: :created
          else
            render json: { error: 'Chat not found' }, status: :not_found
          end
        else
          render json: { error: 'App not found' }, status: :not_found

      end
      
    end


    def message_params
        params.require(:message).permit(:text)
    end

    def index
        application = App.find_by(token: params[:token])
        if application
          chat = application.chats.find_by(chat_number: params[:chat_number])
          if chat
            messages = chat.messages.map { |message| { message_number: message.message_number, text: message.text } }
            render json: { messages: messages }, status: :ok
      
          else
            render json: { error: 'Chat not found' }, status: :not_found
          end
        else 
          render json: { error: 'App not found' }, status: :not_found
        end 
    end
  
    
end
