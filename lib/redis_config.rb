# frozen_string_literal: true

class RedisConfig
  class << self

    DEFAULT_REDIS_URL = "redis://redis:6379/0"

    def get
      {
        url: ENV['REDIS_URL'] || DEFAULT_REDIS_URL
      }
    end

  end
end
