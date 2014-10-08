require 'spec_helper'

describe HackernewsRuby do
  let(:client) { HackernewsRuby::Client.new }

  context 'configure defaults' do
    it 'uses default API URL' do
      expect(client.api_url).to eq "https://hacker-news.firebaseio.com"
    end

    it 'uses default API version' do
      expect(client.api_version).to eq "v0"
    end
  end

  context 'custom configuration' do
    let(:custom_client) do
      HackernewsRuby::Client.new(api_url: "https://hackernews.ycomb.com",
                                 api_version: "v1")
    end

    it "::Client API_URL config" do
      expect(custom_client.api_url).to eq "https://hackernews.ycomb.com"
    end

    it "::Client API_VERSION config" do
      expect(custom_client.api_version).to eq "v1"
    end

  end
end
