class MessageJob
  include Sidekiq::Job

  def perform(token, chat_number, text)
    application = App.find_by(token: token)
    if application
        chat = Chat.find_by(app: application ,chat_number: chat_number)
        if chat
            message_number = chat.messages.count + 1
            message = Message.new({chat: chat, text: text, message_number: message_number})
            message.save
        end
    end
  end

end
