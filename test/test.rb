require 'test/unit'
require 'cinch'
require 'cinch/twitter/simple'

class Cinch::Twitter::Simple::Test < Test::Unit::TestCase
    def setup
        @bot = Cinch::Bot.new do
            self.loggers.clear
        end
        @plugin = Cinch::Twitter::Simple.new(@bot)
    end

    def test_get_tweet
        # thanks wolfpupy
        assert_equal @plugin.get_tweet(445481525144846336).text,
            "going to astrally project myself the hell out of this god damn town"
    end
end
