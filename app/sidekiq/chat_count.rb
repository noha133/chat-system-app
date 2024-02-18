class ChatCount
    include Sidekiq::Worker

    def perform(*args)
        apps = App.all
        apps.each do |app|
            key = "App" + app.id.to_s
            chats_count = ::REDIS.get(key)
            app.chats_count = chats_count
            app.save
        end
    end
end
