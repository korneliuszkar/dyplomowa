require "sidekiq"
require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
  config.redis = { url: ENV["REDIS_URL"], namespace: ENV["REDIS_NAMESPACE"] }
end

Sidekiq.configure_server do |config|
  config.redis = { size: !ENV["SIDEKIQ_REDIS"].nil? ? ENV["SIDEKIQ_REDIS"].to_i : 4 }
  config.redis = { url: ENV["REDIS_URL"], namespace: ENV["REDIS_NAMESPACE"] }
end

Rails.application.config.after_initialize do
  ActiveRecord::Base.connection_pool.disconnect!

  ActiveSupport.on_load(:active_record) do
    config = Rails.application.config.database_configuration[Rails.env]
    config["reaping_frequency"] = !ENV["DB_REAP_FREQ"].nil? ? ENV["DB_REAP_FREQ"].to_i : 10 # seconds
    config["pool"] = !ENV["DB_POOL"].nil? ? ENV["DB_POOL"].to_i : 5
    ActiveRecord::Base.establish_connection(config)
  end
end