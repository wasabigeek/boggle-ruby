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
        assert_true(check_next_letter(@board, "T", 0, "AP"))
    end

    def test_check_word_with_asterisk()
        assert_true(check_next_letter(@board, "B", 9, "OSS"))
    end

    def test_check_word_with_diagonal()
        assert_true(check_next_letter(@board, "B", 9, "EAK"))
        assert_true(check_next_letter(@board, "B", 9, "OAR"))
        assert_true(check_next_letter(@board, "B", 9, "IRD"))
    end

    def test_letters_not_adjacent()
        assert_false(check_next_letter(@board, "*", 3, "ATE"))
    end
end
