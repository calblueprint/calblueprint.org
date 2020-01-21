require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'
require 'iconv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CalBlueprintOrgApp
  class Application < Rails::Application
    # Sentry issue tracking config
    Raven.configure do |config|
      config.dsn = 'https://3e22e232412f4339af121555fd3986af:7a4c60879dc0410eae00461e7f4757b5@sentry.io/1864594'
    end

    # Generator config
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
      generate.controller_specs false
    end

    # Allow CORS for font and other asset loading
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :patch, :options, :head],
          :max_age => 0
      end
    end


    # Raise error when any param isn't permitted
    config.action_controller.action_on_unpermitted_parameters = :raise

    # Set default from email
    config.action_mailer.default_options = { from: "team@calblueprint.org" }

    # Setup Font Asset location
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # config.i18n.default_locale = :de
  end
end
