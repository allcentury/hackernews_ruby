require 'forwardable'
require 'hackernews_ruby/request'

module HackernewsRuby
  class Client
    extend Forwardable

    include Request
    attr_accessor :api_url, :api_version


    def initialize(options={})
      @api_url = "https://hacker-news.firebaseio.com"
      @api_version = "v0"
      @api_url = options[:api_url].nil? ? api_url : options[:api_url]
      @api_version = options[:api_version].nil? ? @api_version : options[:api_version]

      reload_config
    end

    def connection
      params = {}
      @connection = Faraday.new(url: @api_url, params: params,
                                headers: default_headers,
                                ssl: { verify: true } ) do |faraday|
                                  faraday.use FaradayMiddleware::Mashify
                                  faraday.use FaradayMiddleware::ParseJson, content_type: /\bjson$/
                                  faraday.use FaradayMiddleware::FollowRedirects
                                  faraday.adapter Faraday.default_adapter
                                end
    end

    #get_item expects an ID
    #call it like this HackernewsRuby::Client.new.get_item(2324)

    def get_item(id, params={})
      url = "/#{HackernewsRuby.api_version}/item/#{id}.json"
      get(url, params)
    end

    #get_user expects a username
    #HackernewsRuby::Client.new.get_user('allcentury')

    def get_user(id, params={})
      url = "/#{HackernewsRuby.api_version}/user/#{id}.json"
      get(url, params)
    end

    #top_stories returns an array of the top 100 storeis
    #HackernewsRuby::Client.new.top_stories

    def top_stories(params={})
      url = "/#{HackernewsRuby.api_version}/topstories.json"
      get(url, params)
    end

    #changed returns a hash of updates for profiles and items
    #HackernewsRuby::Client.new.changed

    def changed(params={})
      url = "/#{HackernewsRuby.api_version}/updates.json"
      get(url, params)
    end


    private

    def default_headers
      {
        accept: 'application/json',
        content_type: 'application/json',
        user_agent: "Ruby Gem vy HackerNews_Ruby #{HackernewsRuby::VERSION}"
      }
    end

    def reload_config
      HackernewsRuby.api_url = @api_url
      HackernewsRuby.api_version = @api_version
    end
  end
end
