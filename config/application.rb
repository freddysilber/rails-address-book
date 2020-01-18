require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAddressBook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # config.active_record.raise_in_transactional_callbacks = true
    # config.assets.enabled = true
    # config.assets.paths << Rails.root.join('/app/assets/fonts')

    # config.assets.paths << Rails.root.join("app", "assets", "fonts")

  end
end
