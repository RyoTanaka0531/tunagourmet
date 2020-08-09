require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Tunagurume
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
  end
end
Refile.secret_key = 'b8c77559c3b385f02150c2b0730023abc964ca05195de1e3bf010728adc8382071dccaac5fc839f4d7a9b4222688c8cb18735cc014d7503f079bae2533168033'