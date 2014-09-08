require "cinch/twitter/simple/version"
require "cinch"
require "twitter"

module Cinch
    module Twitter
        class Simple
            include Cinch::Plugin

            match /twitter\.com\/[A-z0-9_]+\/status\/(\d+)/, { :use_prefix => false }

            def initialize(*args)
                super

                @twitter_client = ::Twitter::REST::Client.new do |config|
                    config.consumer_key    = ENV['TWITTER_KEY']
                    config.consumer_secret = ENV['TWITTER_SECRET']
                end
            end

            def get_tweet(tweet_id)
                @twitter_client.status(tweet_id)
            rescue
                'Unable to retrieve tweet.'
            end

            def execute(m, tweet_id)
                tweet = self.class.get_tweet(tweet_id)
                m.reply("(@#{tweet.user.screen_name}) #{tweet.text}")
            end
        end
    end
end
