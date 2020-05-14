if Rails.env.production?

  Rails.application.config.session_store :redis_stor, {
    servers: ENV['REDIS_URL'],
    expire_after: 2.days
  }
else
  config.action_controller.perform_caching = true
  config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.to_i}"
  }
end
