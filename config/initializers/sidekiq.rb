Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://eYVX7EwVmmxKPCDmwMtyKVge8oLd2t81@redis:6379/0' }
  end
  
Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://eYVX7EwVmmxKPCDmwMtyKVge8oLd2t81@redis:6379/0' }
  end