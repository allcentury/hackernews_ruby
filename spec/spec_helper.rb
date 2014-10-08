require 'bundler/setup'
Bundler.setup
require 'coveralls'
Coveralls.wear!

require 'vcr'
require 'hackernews_ruby'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |c|

  HackernewsRuby.configure do |config|
    config.api_url = "https://hacker-news.firebaseio.com"
    config.api_version = "v0"
  end

end
