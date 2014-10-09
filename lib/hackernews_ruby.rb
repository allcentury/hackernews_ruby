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
      yield self
    end

  end
end
