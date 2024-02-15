require 'redis'
REDIS = Redis.new(url: 'redis://redis_container:6379')