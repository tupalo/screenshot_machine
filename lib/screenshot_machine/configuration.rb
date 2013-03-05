module ScreenshotMachine
  module Configuration
    # An array of valid keys in the options hash when configuring TweetStream.
    VALID_PARAMS_KEYS = [
      :size,
      :format,
      :cacheLimit,
      :timeout,
      :url,
      :key].freeze

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
      self.size       = "L"     # T, S, E, N, M, L, X, F
      self.format     = "JPG"   # JPG, GIF, PNG
      self.cacheLimit = 14      # 0-14 in days
      self.timeout    = 200     # 0, 200, 400, 600, 800, 1000 in ms
      self.url        = nil
      self.key        = nil
      self
    end
  end
end