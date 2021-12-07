# frozen_string_literal: true

unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_group 'Tweetstream', 'lib/tweetstream'
    add_group 'Specs', 'spec'
  end
end

require 'screenshot_machine'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
