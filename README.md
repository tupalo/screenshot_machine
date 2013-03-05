# ScreenshotMachine

A gem to create screenshots of webpages by using the ScreenshotMachine.com API. You will need a (free) account on ScreenshotMachine.com to get started.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'screenshot_machine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install screenshot_machine

## Usage

Using ScreenshotMachine is quite simple

```ruby
require 'screenshot_machine'

ScreenshotMachine.configure do |config|
  config.key = '012345abcdefg'
end

website_url = "http://google.com/?q=great+gem"
sm = ScreenshotMachine::Generator.new(website_url)
# Returns a binary stream of the file
sm.screenshot
```

You can also config all API Parameters

```ruby
require 'screenshot_machine'

ScreenshotMachine.configure do |config|
  config.key        = '012345abcdefg'
  config.size       = 'X'
  config.format     = 'PNG'
  config.cacheLimit = 2
  config.timeout    = 400
end
```

### Exceptions

```ruby
# ScreenshotMachine::Exceptions::InvalidUrl
# Raised when the website_url can not be resolved by ScreenshotMachine.com
ScreenshotMachine::Generator.new("http://non-existing-example123.com").screenshot
# ScreenshotMachine::Exceptions::InvalidUrl: WARNING: Invalid URL

# ScreenshotMachine::Exceptions::InvalidKey
# Raised when your API key is not set or invalid
ScreenshotMachine::Generator.new("http://non-existing-example123.com").screenshot
# ScreenshotMachine::Exceptions::InvalidKey: ERROR: Invalid API KEY

# ScreenshotMachine::Exceptions::NoCredits
# Raised when there are not sufficient credits in your ScreenshotMachine.com account.
ScreenshotMachine::Generator.new("http://example.com").screenshot
# ScreenshotMachine::Exceptions::NoCredits: ERROR: No Credits for API
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
