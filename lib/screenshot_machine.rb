require "uri"
require "open-uri"
require "screenshot_machine/version"
require "screenshot_machine/configuration"

module ScreenshotMachine
  extend Configuration

  API_URL = "http://api.screenshotmachine.com/"
  
  module Exceptions
    class InvalidUrl < StandardError; end
    class InvalidKey < StandardError; end
    class NoCredits < StandardError; end
  end
end

require "screenshot_machine/generator"