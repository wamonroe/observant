require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require "action_mailbox/engine"
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Observant
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Active Job settings
    config.active_job.queue_adapter = :good_job

    # Action Mailer settings
    if ActiveRecord::Type::Boolean.new.cast(ENV['SMTP_ENABLE'])
      config.action_mailer.delivery_method = :smtp
      config.action_mailer.smtp_settings = {
        address: ENV['SMTP_HOST'],
        port: ENV['SMTP_PORT'].to_i,
        user_name: ENV['SMTP_USER'],
        password: ENV['SMTP_PASS'],
        authentication: 'plain',
        enable_starttls_auto: ActiveRecord::Type::Boolean.new.cast(ENV['SMTP_TLS'])
      }
    end

    # Generator settings
    config.generators do |g|
      # Disable assets
      g.assets false

      # Set primary key type to UUID
      g.orm :active_record, primary_key_type: :uuid
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end

  # Helper for initializer to load a yaml file
  def self.load_config(relative_path)
    YAML.safe_load(
      ERB.new(
        IO.read(
          Rails.root.join(relative_path)
        )
      ).result,
      aliases: true
    )
  end
end
