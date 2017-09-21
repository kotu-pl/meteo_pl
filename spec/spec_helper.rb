require './lib/meteo_pl'
require './spec/support/shared_helper'
require 'webmock/rspec'
require 'pry'

RSpec.configure do |config|
  config.include SharedHelper
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
