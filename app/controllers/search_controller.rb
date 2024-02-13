class SearchController < ApplicationController
    def search_message
        application = App.find_by(token: params[:token])
        unless application
          render json: { error: 'App not found' }, status: :not_found
        end
        chat = application.chats.find_by(chat_number: params[:chat_number])
        unless chat
          render json: { error: 'Chat not found' }, status: :not_found
        end
        messages = chat.messages
        @messages = messages.search(params[:q])
        @messages =  @messages.map { |message| { chat: message.message_number, text: message.text } }
        render json: { messages: @messages}, status: :ok
    end
end
