require 'spec_helper'

describe HackernewsRuby::Client do
  let(:client) { HackernewsRuby::Client.new }

  it 'creates a Faraday::Connection' do
    expect(client.connection).to be_kind_of Faraday::Connection
  end
  it '#get_story' do
    story = client.get_story
    expect(story).to_not be_nil
  end
end
