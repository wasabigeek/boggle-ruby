require "./helpers.rb"
require "test/unit"

class TestApp < Test::Unit::TestCase
    def test_adjacent_indexes()
        assert_equal(get_adjacent_indexes(0), [4, 1, 5])
    end
end
