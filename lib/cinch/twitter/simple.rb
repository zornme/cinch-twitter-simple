require "cinch/twitter/simple/version"
require "cinch"
require "twitter"

module Cinch
  module Twitter
    class Simple
        include Cinch::Plugin

        match /twitter\.com\/[A-z0-9_]+\/status\/(\d+)/, { :use_prefix => false }

        def self.get_tweet(tweet_id)
            client = ::Twitter::REST::Client.new do |config|
                config.consumer_key    = ENV['TWITTER_KEY']
                config.consumer_secret = ENV['TWITTER_SECRET']
            end

            client.status(tweet_id)
        end

        def execute(m, tweet_id)
            tweet = self.class.get_tweet(tweet_id)
            m.reply("(@#{tweet.user.screen_name}) #{tweet.text}")
        end
    end
  end
end
