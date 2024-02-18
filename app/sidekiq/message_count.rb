class MessageCount
    include Sidekiq::Worker

    def perform(*args)
        chats = Chat.all
        chats.each do |chat|
            chat_id = chat.id
            key = "chat" + chat_id.to_s
            messages_count = ::REDIS.get(key)
            chat.messages_count = messages_count
            chat.save
        end
    end
end
