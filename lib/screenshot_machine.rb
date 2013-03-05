require "uri"
require "open-uri"
require "screenshot_machine/version"

module ScreenshotMachine
  API_KEY = 'PUT_YOUR_KEY_HERE'
  API_URL = 'http://api.screenshotmachine.com/'

  # https://www.screenshotmachine.com/apiguide.php
  DEFAULT_PARAMS = {
    :size       => "L",     # T, S, E, N, M, L, X, F
    :format     => "JPG",   # JPG, GIF, PNG
    :cacheLimit => 14,      # 0-14 in days
    :timeout    => 200      # 0, 200, 400, 600, 800, 1000 in ms
  }
end

require "screenshot_machine/generator"