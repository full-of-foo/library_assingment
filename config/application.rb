require File.expand_path('../boot', __FILE__)
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module LibraryAssignment
  class Application < Rails::Application

    I18n.enforce_available_locales = true
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    config.stripe.api_key = ENV['STRIPE_API_KEY']
    config.stripe.publishable_key = "pk_test_wj7qS9RwuQGQZ8SfhRj76p5k"
  end
end
