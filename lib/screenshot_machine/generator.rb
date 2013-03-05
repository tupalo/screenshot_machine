module ScreenshotMachine
  class Generator
    
    attr_accessor *Configuration::VALID_PARAMS_KEYS
    
    def initialize(url, options={})
      merged_options = ScreenshotMachine.options.
        merge({ :url => url }).
        merge(options)
      Configuration::VALID_PARAMS_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

    def screenshot
      @screenshot ||= begin
        response = open(screenshot_url)
        case response.meta["x-screenshotmachine-response"]
        when "invalid_url"
          raise Exceptions::InvalidUrl, "WARNING: Invalid URL"
        when "invalid_key"
          raise Exceptions::InvalidKey, "ERROR: Invalid API KEY"
        when "no_credits"
          raise Exceptions::NoCredits,  "ERROR: No Credits for API"
        end
        response.read
      end
    end

    private

      def params
        Hash[*Configuration::VALID_PARAMS_KEYS.map {|key| [key, send(key)] }.flatten]
      end

      def screenshot_url
        uri = URI.parse(API_URL)
        uri.query = URI.escape(params.map{|k,v| "#{k}=#{v}"}.join('&'))
        uri.to_s
      end
  end
end