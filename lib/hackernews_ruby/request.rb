require 'active_support'
require 'active_support/core_ext'
require 'multi_json'

module HackernewsRuby
  module Request

    def get(path, options)
      if path.include?("/v0/maxitem.json")
        #maxitem is not currently giving back a valid json object
        #having to make a regular get request because of faraday parse error
        res = Faraday.get("#{HackernewsRuby.api_url}#{path}")
        res.body
      else
        request(:get, path, options)
      end
    end

    def request(method, path, options)
      response = connection.send(method) do |request|
        case method
        when :get
          request.url(path, options)
        end
      end

      response.body
    end

  end
end
