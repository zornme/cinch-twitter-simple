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

Set the TWITTER_KEY and TWITTER_SECRET environment variables and then:

    bot = Cinch::Bot.new do
      configure do |c|
        c.server   = "irc.freenode.org"
        c.channels = ["#cinch-bots"]
        c.plugins.plugins = [Cinch::Twitter::Simple]
      end
    end
