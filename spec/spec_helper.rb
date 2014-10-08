require 'bundler/setup'
Bundler.setup
require 'coveralls'
Coveralls.wear!

require 'vcr'
require 'pry'
require 'hackernews_ruby'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
  c.ignore_localhost = true
  c.default_cassette_options = {
    record: :new_episodes,
    re_record_interval: 7.days
  }
end

RSpec.configure do |c|

  HackernewsRuby.configure do |config|
    config.api_url = "https://hacker-news.firebaseio.com"
    config.api_version = "v0"
  end

end
