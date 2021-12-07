# frozen_string_literal: true

require 'spec_helper'

describe ScreenshotMachine do
  after do
    ScreenshotMachine.reset
  end

  describe '.new' do
    it 'is a ScreenshotMachine::Generator' do
      expect(ScreenshotMachine.new('')).to be_a ScreenshotMachine::Generator
    end
  end

  describe '.size' do
    it 'returns the default size' do
      expect(ScreenshotMachine.size).to eq(ScreenshotMachine::Configuration::DEFAULT_SIZE)
    end
  end

  describe '.size=' do
    it 'sets the size' do
      ScreenshotMachine.size = 'X'
      expect(ScreenshotMachine.size).to eq('X')
    end
  end

  describe '.format' do
    it 'returns the default format' do
      expect(ScreenshotMachine.format).to eq(ScreenshotMachine::Configuration::DEFAULT_FORMAT)
    end
  end

  describe '.format=' do
    it 'sets the format' do
      ScreenshotMachine.format = 'PNG'
      expect(ScreenshotMachine.format).to eq('PNG')
    end
  end

  describe '.cacheLimit' do
    it 'returns the default cacheLimit' do
      expect(ScreenshotMachine.cacheLimit).to eq(ScreenshotMachine::Configuration::DEFAULT_CACHELIMIT)
    end
  end

  describe '.cacheLimit=' do
    it 'sets the cacheLimit' do
      ScreenshotMachine.cacheLimit = 400
      expect(ScreenshotMachine.cacheLimit).to eq(400)
    end
  end

  describe '.timeout' do
    it 'returns the default timeout' do
      expect(ScreenshotMachine.timeout).to eq(ScreenshotMachine::Configuration::DEFAULT_TIMEOUT)
    end
  end

  describe '.timeout=' do
    it 'sets the timeout' do
      ScreenshotMachine.timeout = 400
      expect(ScreenshotMachine.timeout).to eq(400)
    end
  end

  describe '.url' do
    it 'returns the default url' do
      expect(ScreenshotMachine.url).to eq(ScreenshotMachine::Configuration::DEFAULT_URL)
    end
  end

  describe '.url=' do
    it 'sets the url' do
      ScreenshotMachine.url = 'http://example.com'
      expect(ScreenshotMachine.url).to eq('http://example.com')
    end
  end

  describe '.key' do
    it 'returns the default key' do
      expect(ScreenshotMachine.key).to eq(ScreenshotMachine::Configuration::DEFAULT_KEY)
    end
  end

  describe '.key=' do
    it 'sets the key' do
      ScreenshotMachine.key = 'abcdefgh123456'
      expect(ScreenshotMachine.key).to eq('abcdefgh123456')
    end
  end

  describe '.configure' do
    ScreenshotMachine::Configuration::VALID_PARAMS_KEYS.each do |key|
      it "sets the #{key}" do
        ScreenshotMachine.configure do |config|
          config.send("#{key}=", key)
          expect(ScreenshotMachine.send(key)).to eq(key)
        end
      end
    end
  end

  describe '.options' do
    it 'returns the configuration as a hash' do
      expect(ScreenshotMachine.options).to be_kind_of(Hash)
    end
  end
end
