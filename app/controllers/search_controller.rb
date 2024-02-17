class SearchController < ApplicationController
    def search_message
      application = App.find_by(token: params[:token])
      if application
        chat = application.chats.find_by(chat_number: params[:chat_number])
        if chat
          messages = chat.messages
          @messages = messages.search(params[:q])
          @messages =  @messages.map { |message| { message_number: message.message_number, text: message.text } }
          render json: { messages: @messages}, status: :ok
        else 
          render json: { error: 'Chat not found' }, status: :not_found
        end
      else
        render json: { error: 'App not found' }, status: :not_found
      end 
    end
end
