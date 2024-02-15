class ChatJob
  include Sidekiq::Worker

  def perform(token, text)
    application = App.find_by(token: token)
    if application
      key = application.id
      key = key.to_s
      redis = Redis.new(url: 'redis://redis_container:6379')
      chat_number = redis.incr(key)
      chat = Chat.new({chat_number: chat_number,app_id: application.id})
      chat.save
    end
  end
end
