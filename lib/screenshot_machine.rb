# frozen_string_literal: true

require 'uri'
require 'open-uri'
require 'screenshot_machine/version'
require 'screenshot_machine/configuration'

module ScreenshotMachine
  extend Configuration

  API_URL = 'http://api.screenshotmachine.com/'

  module Exceptions
    class InvalidUrl < StandardError; end
    class InvalidKey < StandardError; end
    class NoCredits < StandardError; end
    class SystemError < StandardError; end
  end

  class << self
    # Alias for ScreenshotMachine::Generator.new
    #
    # @return [ScreenshotMachine::Generator]
    def new(url, options = {})
      ScreenshotMachine::Generator.new(url, options)
    end

    # Delegate to ScreenshotMachine::Generator
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)

      new.send(method, *args, &block)
    end

    # Delegate to ScreenshotMachine::Generator
    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end

require 'screenshot_machine/generator'
