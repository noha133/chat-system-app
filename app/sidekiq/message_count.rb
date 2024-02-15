class MessageCount
    include Sidekiq::Worker

    def perform(*args)
        chats = Chat.all
        chats.each do |chat|
            key = chat.id
            messages_count = ::REDIS.get(key)
            chat.messages_count = messages_count
            chat.save
        end
    end
end
