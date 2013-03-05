# -*- encoding: utf-8 -*-
require File.expand_path('../lib/screenshot_machine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Constantin Hofstetter"]
  gem.email         = ["consti@consti.de"]
  gem.description   = %q{Screenshot Machine Gem}
  gem.summary       = %q{This gem returns a screenshot of a webpage, using the ScreenshotMachine.com API (free account required).}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "screenshot_machine"
  gem.require_paths = ["lib"]
  gem.version       = ScreenshotMachine::VERSION
end
