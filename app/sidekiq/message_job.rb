class MessageJob
  include Sidekiq::Worker

  def perform(message_number, chat_id,text)
            message = Message.new({chat_id: chat_id, text: text, message_number: message_number})
            message.save
  end

end
