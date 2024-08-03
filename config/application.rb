require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module FirearmDepot
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Disable Zeitwerk autoloading
    config.autoloader = :classic

    # Configuration for classic autoloading (optional, if you need to add any custom autoload paths)
    config.eager_load_paths += %W(#{config.root}/lib)
  end
end
