# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ScreenshotMachine::Generator do
  describe '.new' do
    it 'requires one argument' do
      expect { ScreenshotMachine::Generator.new }.to raise_error(ArgumentError)
      expect(ScreenshotMachine::Generator).to respond_to(:new).with(1).argument
    end

    it 'takes an optional second argument' do
      expect(ScreenshotMachine::Generator).to respond_to(:new).with(2).arguments
    end

    it 'initializes with one argument' do
      generator = ScreenshotMachine::Generator.new(true)
      expect(generator).to be_kind_of(ScreenshotMachine::Generator)
    end

    it 'takes the url as first argument' do
      url = 'http://example.com'
      generator = ScreenshotMachine::Generator.new(url)
      expect(generator.url).to eq(url)
    end

    it 'takes the options as second argument' do
      url       = nil
      options   = { key: 'abc123' }
      generator = ScreenshotMachine::Generator.new(url, options)
      expect(generator.key).to eq(options[:key])
    end
  end

  describe '.screenshot_url' do
    let(:generator) { ScreenshotMachine::Generator.new('http://example.com') }

    it 'calls params' do
      generator.should_receive(:params).and_return({ a: 'b', c: 'd' })
      generator.send(:screenshot_url)
    end

    it 'includes all params' do
      generator.should_receive(:params).and_return({ a: 'b', c: 'd' })
      expect(generator.send(:screenshot_url)).to match('a=b')
    end

    it 'includes the API_URL' do
      expect(generator.send(:screenshot_url)).to match(ScreenshotMachine::API_URL)
    end
  end

  describe '.screenshot' do
    before do
      stub_request(:get, /api\.screenshotmachine\.com.*/)
        .to_return(
          status: 200,
          headers: { 'x-screenshotmachine-response' => 'invalid_url' }
        )
    end

    let(:generator) { ScreenshotMachine::Generator.new('http://example.com') }

    context 'when a valid API call' do
      it 'returns a string' do
        stub_request(:get, /api\.screenshotmachine\.com.*/)
        expect(generator.screenshot.class).to eq(String)
      end
    end

    context 'when requesting an invalid URL' do
      it 'should raise an exception' do
        stub_request(:get, /api\.screenshotmachine\.com.*/)
          .to_return(
            status: 200,
            headers: { 'x-screenshotmachine-response' => 'invalid_url' }
          )
        expect { generator.screenshot }.to raise_error(ScreenshotMachine::Exceptions::InvalidUrl)
      end
    end

    context 'when requesting an invalid API KEY' do
      it 'should raise an exception' do
        stub_request(:get, /api\.screenshotmachine\.com.*/)
          .to_return(
            status: 200,
            headers: { 'x-screenshotmachine-response' => 'invalid_key' }
          )
        expect { generator.screenshot }.to raise_error(ScreenshotMachine::Exceptions::InvalidKey)
      end
    end

    context 'when requesting with no credits left' do
      it 'should raise an exception' do
        stub_request(:get, /api\.screenshotmachine\.com.*/)
          .to_return(
            status: 200,
            headers: { 'x-screenshotmachine-response' => 'no_credits' }
          )
        expect { generator.screenshot }.to raise_error(ScreenshotMachine::Exceptions::NoCredits)
      end
    end

    context 'when screenshotmachine returns a system_error' do
      it 'should raise an exception' do
        stub_request(:get, /api\.screenshotmachine\.com.*/)
          .to_return(
            status: 200,
            headers: { 'x-screenshotmachine-response' => 'system_error' }
          )
        expect { generator.screenshot }.to raise_error(ScreenshotMachine::Exceptions::SystemError)
      end
    end
  end
end
