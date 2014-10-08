require "hackernews_ruby/version"
require "faraday"
require "faraday_middleware"
require "hackernews_ruby/client"
require "hackernews_ruby/version"

directory = File.expand_path(File.dirname(__FILE__))

module HackernewsRuby
  class << self
    attr_accessor :api_url, :api_version

    ## configure default
    def configure
      load_defaults
      yield self
      true
    end

    private

    def load_defaults
      self.api_url ||= 'https://hacker-news.firebaseio.com'
      self.api_version ||= 'v0'
    end

  end
end
