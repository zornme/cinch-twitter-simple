# Cinch::Twitter::Simple

A Simple Cinch IRC bot plugin that watches chat for tweet urls and responds to them with the tweet's text.

## Installation

Add this line to your application's Gemfile:

    gem 'cinch-twitter-simple'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cinch-twitter-simple

## Usage

Set the TWITTER_CONSUMER_KEY and TWITTER_CONSUMER_SECRET environment variables and then:

    bot = Cinch::Bot.new do
      configure do |c|
        c.server   = "irc.freenode.org"
        c.channels = ["#cinch-bots"]
        c.plugins.plugins = [Cinch::Twitter::Simple]
      end
    end

Set TWITTER_ACCESS_TOKEN and TWITTER_ACCESS_SECRET as well if you would like to post tweets from the bot.
