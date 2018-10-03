module ScreenshotMachine
  module Configuration
    # An array of valid keys in the options hash when configuring TweetStream.
    VALID_PARAMS_KEYS = [
      :key,
      :url,
      :dimension,
      :device,
      :format,
      :hash,
      :cacheLimit,
      :delay].freeze

     # @private
    attr_accessor *VALID_PARAMS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      Hash[*VALID_PARAMS_KEYS.map {|key| [key, send(key)] }.flatten]
    end

    # Reset all configuration options to defaults
    def reset
      VALID_PARAMS_KEYS.each {|key| self.method(key.to_s + '=').call(nil)}
      self
    end
  end
end
