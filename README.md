# ScreenshotMachine

A gem to create screenshots of webpages by using the ScreenshotMachine.com API. You will need a (free) account on ScreenshotMachine.com to get started.

## Installation

Add this line to your application's Gemfile:

    gem 'screenshot_machine'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install screenshot_machine

## Usage
    
    website_url = "http://google.com/?q=great+gem"
    sm = ScreenshotMachine::Generator.new(website_url)
    # Returns a .read on the file
    sm.screenshot

Generator.new also accepts options:

    ScreenshotMachine::Generator.new(
      "http://google.com/?q=great+gem",
      {
        :size       => "L",     # T, S, E, N, M, L, X, F
        :format     => "JPG",   # JPG, GIF, PNG
        :cacheLimit => 14,      # 0-14 in days
        :timeout    => 200      # 0, 200, 400, 600, 800, 1000 in ms
      }
    )

### Exceptions
    
    # ScreenshotMachine::Exceptions::InvalidUrl
    # Raised when the website_url can not be resolved by ScreenshotMachine.com
    ScreenshotMachine::Generator.new("http://non-existing-example123.com").screenshot
    # ScreenshotMachine::Exceptions::InvalidUrl: WARNING: Invalid URL

    # ScreenshotMachine::Exceptions::NoCredits
    # Raised when there are not sufficient credits in your ScreenshotMachine.com account.
    ScreenshotMachine::Generator.new("http://example.com").screenshot
    # ScreenshotMachine::Exceptions::NoCredits: ERROR: No Credits for API

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
