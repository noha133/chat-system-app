class MessagesController < ApplicationController
    def create
      token = params[:token]
      chat_number = params[:chat_number]
      text = params[:text]
      MessageJob.perform_async(token, chat_number, text)
      render json: { status: "created" }, status: :ok
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
