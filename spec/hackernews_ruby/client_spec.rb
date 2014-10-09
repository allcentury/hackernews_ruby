require 'spec_helper'

describe HackernewsRuby::Client do
  let(:client) { HackernewsRuby::Client.new }

  it 'creates a Faraday::Connection' do
    expect(client.connection).to be_kind_of Faraday::Connection
  end
  it '#get_item story' do
    VCR.use_cassette('get_story') do
      story = client.get_item(8863)

      expect(story).to_not be_nil
      expect(story.id).to eq 8863
      expect(story.type).to eq "story"
      expect(story.kids).to be_kind_of Array
    end
  end

  it '#get_item comment' do
    VCR.use_cassette('get_comment') do
      comment = client.get_item(2921983)

      expect(comment).to_not be_nil
      expect(comment.id).to eq 2921983
      expect(comment.type).to eq "comment"
    end
  end

  it '#get_item poll' do

    VCR.use_cassette('get_comment') do
      poll = client.get_item(126809)

      expect(poll).to_not be_nil
      expect(poll.id).to eq 126809
      expect(poll.type).to eq "poll"
      expect(poll.score).to_not be_nil
      expect(poll.parts).to be_kind_of Array
    end
  end

  it '#get_user' do
    VCR.use_cassette('get_user') do
      user = client.get_user('jl')

      expect(user.about).to eq "This is a test"
      expect(user.created).to eq 1173923446
    end
  end

  it "#top_storeis" do
    VCR.use_cassette('top_stories') do
      tstories = client.top_stories

      expect(tstories).to be_kind_of Array
      expect(tstories.all? { |id| id.is_a? Fixnum} ).to eq true
    end
  end

  it "#changed" do
    VCR.use_cassette('changed') do
      changed = client.changed

      expect(changed.items).to be_kind_of Array
      expect(changed.profiles).to be_kind_of Array
    end
  end
end
