require 'rubocop'
require 'rubocop/rspec/support'

module SpecHelper
  ROOT = Pathname.new(__dir__).parent.freeze
end

spec_helper_glob = File.expand_path('{support,shared}/*.rb', __dir__)
Dir.glob(spec_helper_glob).map(&method(:require))

RSpec.configure do |config|
  # Basic configuraiton
  config.run_all_when_everything_filtered = true
  config.filter_run(:focus)
  config.order = :random

  # Define spec metadata for all rspec cop spec files
  cop_specs = 'spec/rubocop/cop/chef/'
  config.define_derived_metadata(file_path: /\b#{cop_specs}/) do |metadata|
    # Attach metadata that signals the specified code is for an RSpec only cop
    metadata[:chef_cop] = true
  end

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect # Disable `should`
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect # Disable `should_receive` and `stub`
  end

  config.include(ExpectViolation)
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubocop-chef'
