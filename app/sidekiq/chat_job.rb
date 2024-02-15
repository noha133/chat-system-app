class ChatJob
  include Sidekiq::Worker

  def perform(chat_number, app_id)
    chat = Chat.new({chat_number: chat_number,app_id: app_id})
    chat.save
  end
end
