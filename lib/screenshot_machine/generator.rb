module ScreenshotMachine
  class Generator
    def initialize(url, opts={})
      @options = DEFAULT_PARAMS.
        merge({
            :key => API_KEY,
            :url => url
        }).merge(opts)    
    end

    def screenshot
      @screenshot ||= begin
        response = open(screenshot_url)
        case response.meta["x-screenshotmachine-response"]
        when "invalid_url"
          raise Exceptions::InvalidUrl, "WARNING: Invalid URL"
        when "no_credits"
          raise Exceptions::NoCredits, "ERROR: No Credits for API"
        end
        response.read
      end
    end

    private
      def screenshot_url
        uri = URI.parse(API_URL)
        uri.query = URI.escape(@options.map{|k,v| "#{k}=#{v}"}.join('&'))
        uri.to_s
      end
  end

  module Exceptions
    class InvalidUrl < StandardError; end
    class NoCredits < StandardError; end
  end

end