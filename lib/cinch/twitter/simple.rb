require "cinch/twitter/simple/version"
require "cinch"
require "twitter"

module Cinch
    module Twitter
        class Simple
            include Cinch::Plugin
            attr_reader :twitter_client


            def initialize(*args)
                super

                @twitter_client = ::Twitter::REST::Client.new do |config|
                    config.consumer_key        = ENV['TWITTER_CONSUMER_KEY'] || ENV['TWITTER_KEY']
                    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET'] || ENV['TWITTER_SECRET']
                    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
                    config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
                end
            end

            match /twitter\.com\/[A-z0-9_]+\/status\/(\d+)/, :use_prefix => false, method: :retrieve
            def retrieve(m, tweet_id)
                begin
                    tweet = @twitter_client.status(tweet_id)
                rescue
                    puts $!
                    m.reply("aw heck i'm broken :(")
                else
                    m.reply("(@#{tweet.user.screen_name}) #{tweet.text}")
                end
            end

            match /^!tweet (.+)$/, :use_prefix => false, method: :send
            def send(m, tweet_content)
                begin
                    tweet = @twitter_client.update(tweet_content)
                rescue
                    puts $!
                    m.reply("aw heck i'm broken :(")
                else
                    m.reply("(@#{tweet.user.screen_name}) #{tweet.text}")
                end
            end
        end
    end
end
