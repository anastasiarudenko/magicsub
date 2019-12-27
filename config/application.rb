require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Untitled
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.log_level = ENV.fetch('LOG_LEVEL', 'INFO').downcase

    if ENV['RAILS_LOG_TO_STDOUT'].present?
      logger           = ActiveSupport::Logger.new(STDOUT)
      logger.level     = ActiveSupport::Logger.const_get(config.log_level.to_s.upcase)
      config.logger    = ActiveSupport::TaggedLogging.new(logger)
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :ru
    config.assets.initialize_on_precompile = false
  end
end
