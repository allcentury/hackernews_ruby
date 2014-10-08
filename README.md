# HackernewsRuby

[![Coverage Status](https://coveralls.io/repos/allcentury/hackernews_ruby/badge.png?branch=master)](https://coveralls.io/r/allcentury/hackernews_ruby?branch=master)

A wrapper for the new Hacker News API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hackernews_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hackernews_ruby

## Usage

Instantiate a client like so:

```ruby
client = HackernewsRuby::Client.new
```

Now you can do:

```ruby
client.get_item(834129)
```
This will get any item available on the API by ID such as stories, comments, polls and jobs.

Say you wanted the title of a story:

```ruby
story = client.get_item(8863) #story_id
story.title
=> "My YC app: Dropbox - Throw away your USB drive"
```

Say you wanted to fetch a particular user:

```ruby
user = client.get_user('jl') #userid is case sensitive
user.about
=> "This is a test"
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/hackernews_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
