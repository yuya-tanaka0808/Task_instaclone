require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module DiveIntoWork
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.available_locales = %i[ja en]
    config.i18n.default_locale = :ja
    config.assets.initialize_on_precompile = false
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.generators do |g|
      g.assets false
      g.helper false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
