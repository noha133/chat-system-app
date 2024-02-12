class MessagesController < ApplicationController
    def create
        application = App.find_by(token: params[:token])
      
        unless application
          render json: { error: 'App not found' }, status: :not_found
        end
      
        chat = application.chats.find_by(chat_number: params[:chat_number])
      
        unless chat
          render json: { error: 'Chat not found' }, status: :not_found
        end
      
        message_number = chat.messages.count + 1
        message = chat.messages.build(text: params[:text], message_number: message_number)
      
        if message.save
          render json: { message: message.text, message_number: message_number }, status: :created
        else
          render json: message.errors, status: :unprocessable_entity
        end
    end

    def message_params
        params.require(:message).permit(:text)
    end

    def index
        application = App.find_by(token: params[:token])
      
        unless application
          render json: { error: 'App not found' }, status: :not_found
        end
      
        chat = application.chats.find_by(chat_number: params[:chat_number])
      
        unless chat
          render json: { error: 'Chat not found' }, status: :not_found
        end
      
        messages = chat.messages.map { |message| { message_number: message.message_number, text: message.text } }
        render json: { messages: messages }, status: :ok
      end
    
end
