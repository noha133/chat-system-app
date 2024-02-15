class MessageJob
  include Sidekiq::Worker

  def perform(token, chat_number, text)
    application = App.find_by(token: token)
    if application
        chat = Chat.find_by(app: application ,chat_number: chat_number)
     
        if chat
            key = chat.id
            key = key.to_s
            redis = Redis.new(url: 'redis://redis_container:6379')
            message_number = redis.incr(key)
            message = Message.new({chat: chat, text: text, message_number: message_number})
            message.save
        end
    end
  end

end
