require "./helpers.rb"
require "test/unit"


class TestAdjacentIndexes < Test::Unit::TestCase
    def test_adjacent_indexes()
        assert_equal(get_adjacent_indexes(0), [4, 1, 5])
        assert_equal(get_adjacent_indexes(5), [1, 9, 4, 6, 0, 2, 8, 10])
    end
end


class TestCheckWord < Test::Unit::TestCase
    def setup
        board_file = open('board.txt', 'r')
        @board = board_file.read.split(", ")
        board_file.close
    end

    def test_check_horizontal_word()
        assert_true(check_word(@board, "TAP"))
    end

    def test_check_word_with_asterisk()
        assert_true(check_word(@board, "BOSS"))
    end

    def test_check_word_with_diagonal()
        assert_true(check_word(@board, "BEAK"))
        assert_true(check_word(@board, "BOAR"))
        assert_true(check_word(@board, "BIRD"))
    end

    def test_letters_not_adjacent()
        assert_false(check_word(@board, "DATE"))
        # this case can pass if reverse traversal is allowed
        assert_false(check_word(@board, "BOSSDOM"))
    end
end
