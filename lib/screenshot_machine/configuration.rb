# frozen_string_literal: true

module ScreenshotMachine
  module Configuration
    # An array of valid keys in the options hash when configuring TweetStream.
    VALID_PARAMS_KEYS = %i[
      size
      format
      cacheLimit
      timeout
      url
      key
    ].freeze

    # @private
    attr_accessor(*VALID_PARAMS_KEYS)

    DEFAULT_SIZE        = 'L'     # T, S, E, N, M, L, X, F
    DEFAULT_FORMAT      = 'JPG'   # JPG, GIF, PNG
    DEFAULT_CACHELIMIT  = 14      # 0-14 in days
    DEFAULT_TIMEOUT     = 200     # 0, 200, 400, 600, 800, 1000 in ms
    DEFAULT_URL         = nil
    DEFAULT_KEY         = nil

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
      Hash[*VALID_PARAMS_KEYS.map { |key| [key, send(key)] }.flatten]
    end

    # Reset all configuration options to defaults
    def reset
      self.size       = DEFAULT_SIZE
      self.format     = DEFAULT_FORMAT
      self.cacheLimit = DEFAULT_CACHELIMIT
      self.timeout    = DEFAULT_TIMEOUT
      self.url        = DEFAULT_URL
      self.key        = DEFAULT_KEY
      self
    end
  end
end
