require 'active_support'
require 'active_support/core_ext'
require 'multi_json'

module HackernewsRuby
  module Request

    def get(path, options)
      request(:get, path, options)
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
