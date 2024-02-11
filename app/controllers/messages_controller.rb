class MessagesController < ApplicationController
    def create
        application = App.find_by(token: params[:token])
        if application
            chat = Chat.find_by(app: application ,chat_number: params[:chat_number])
            if chat
                message_number = chat.messages.count + 1
                message = Message.new({chat: chat, text: params[:text], message_number: message_number})
                if message.save
                    render json: { message: message.text,message_number: message_number }, status: :created
                else
                    render json: message.errors, status: :unprocessable_entity
                end
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
    
end
