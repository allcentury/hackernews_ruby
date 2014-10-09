# HackernewsRuby

[![Coverage Status](https://coveralls.io/repos/allcentury/hackernews_ruby/badge.png?branch=master)](https://coveralls.io/r/allcentury/hackernews_ruby?branch=master)
[![Build Status](https://travis-ci.org/allcentury/hackernews_ruby.svg?branch=master)](https://travis-ci.org/allcentury/hackernews_ruby)

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

## Items

Items have the following fields:

[Outlined here form HN](https://github.com/HackerNews/API/blob/master/README.md#items)

Field | Description
------|------------
id | The item's unique id. Required.
deleted | `true` if the item is deleted.
type | The type of item. One of "job", "story", "comment", "poll", or "pollopt".
by | The username of the item's author.
time | Creation date of the item, in [Unix Time](http://en.wikipedia.org/wiki/Unix_time).
text | The comment, Ask HN, or poll text. HTML.
dead | `true` if the item is dead.
parent | The item's parent. For comments, either another comment or the relevant story. For pollopts, the relevant poll.
kids | The ids of the item's comments, in ranked display order.
url | The URL of the story.
score | The story's score, or the votes for a pollopt.
title | The title of the story or poll.
parts | A list of related pollopts, in display order.

To get an **item** simply do:

```ruby
client.get_item(834129)
```
This will get any item available on the API by ID such as stories, comments, polls and jobs.

Say you wanted the **title** of a story:

```ruby
story = client.get_item(8863) #story_id
story.title
=> "My YC app: Dropbox - Throw away your USB drive"
```

## Users

Users have the following fields:

[Outlined here from HN](https://github.com/HackerNews/API/blob/master/README.md#user://github.com/HackerNews/API/blob/master/README.md#users)

Field | Description
------|------------
id | The user's unique username. Case-sensitive. Required.
delay | Delay in minutes between a comment's creation and its visibility to other users.
created | Creation date of the user, in [Unix Time](http://en.wikipedia.org/wiki/Unix_time).
karma | The user's karma.
about | The user's optional self-description. HTML.
submitted | List of the user's stories, polls and comments.

Say you wanted to fetch a particular **user**:

```ruby
user = client.get_user('jl') #userid is case sensitive
user.about
=> "This is a test"
```

## Live Data

To fetch the top 100 stories:

```ruby
stories = client.top_stories
```

This will return an array of ID's.  To get each story after that, just use the get_item method like this:

```ruby
stories = client.top_stories
stories.each do |story|
  resp = client.get_item(story)
  puts resp.title
  puts resp.score
  puts resp.url
end
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/hackernews_ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
