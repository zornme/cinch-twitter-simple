require 'test/unit'
require 'cinch/twitter/simple'

class ParrotTest < Test::Unit::TestCase
    def test_english_hello
        assert_equal Cinch::Twitter::Simple.get_tweet(445481525144846336).text,
        "going to astrally project myself the hell out of this god damn town"
    end
end