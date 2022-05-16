ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

require 'spec_helper'
require 'rspec/rails'
require 'json_matchers/rspec'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = Rails.root.join('spec', 'fabricators')

  # Set `true` for using in System test
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include Rails.application.routes.url_helpers

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true if meta[:type] == :mailer
  end
end
