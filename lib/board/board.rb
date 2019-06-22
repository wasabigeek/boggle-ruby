require 'json'


class Board
    attr_reader :tiles

    def initialize(tiles: nil)
        @tiles = tiles.nil? ? generate_tiles : tiles
    end

    def check_word(word)
        valid_words.include?(word)
    end

    def print_board
        puts "Here's the board:"
        tiles.each_with_index {|tile, index|
            print "#{tile} #{"\n"if index % 4 == 3}"
        }
    end

    def find_word(word)
        word = word.upcase  # to prevent any casing issues

        tiles.each_with_index do |tile, index|
            # can remove this
            next unless tile == word[0] || tile == "*"
            # find possible starts
            return true if can_form_word_from_index(tiles, index, word, [])
        end

        return false
    end

    private

        def valid_words
            @valid_words ||= generate_valid_words
        end

        def generate_tiles
            # https://boardgames.stackexchange.com/q/29264
            dice = [
                ['R', 'I', 'F', 'O', 'B', 'X', '*'],
                ['I', 'F', 'E', 'H', 'E', 'Y', '*'],
                ['D', 'E', 'N', 'O', 'W', 'S', '*'],
                ['U', 'T', 'O', 'K', 'N', 'D', '*'],
                ['H', 'M', 'S', 'R', 'A', 'O', '*'],
                ['L', 'U', 'P', 'E', 'T', 'S', '*'],
                ['A', 'C', 'I', 'T', 'O', 'A', '*'],
                ['Y', 'L', 'G', 'K', 'U', 'E', '*'],
                ['QU', 'B', 'M', 'J', 'O', 'A', '*'],
                ['E', 'H', 'I', 'S', 'P', 'N', '*'],
                ['V', 'E', 'T', 'I', 'G', 'N', '*'],
                ['B', 'A', 'L', 'I', 'Y', 'T', '*'],
                ['E', 'Z', 'A', 'V', 'N', 'D', '*'],
                ['R', 'A', 'L', 'E', 'S', 'C', '*'],
                ['U', 'W', 'I', 'L', 'R', 'G', '*'],
                ['P', 'A', 'C', 'E', 'M', 'D', '*'],
            ]

            # To enable * use rand(7)
            tiles = dice.map {|sides| sides[Random.new.rand(6)]}
        end

        def generate_valid_words
            dictionary = File.read("lib/board/dictionary.txt").split("\n")
            valid_words = dictionary.select {|word| find_word(tiles, word)}
        end

        # Given a tile's index (0 - 15), return a list of adjacent tile indexes
        def get_adjacent_indexes(index)
            row = (index / 4)  # Ruby will round-down integer division
            col = index % 4

            adjacent_indexes = []
            adjacent_indexes.push(index - 4) if row > 0  # top
            adjacent_indexes.push(index + 4) if row < 3  # bottom
            adjacent_indexes.push(index - 1) if col > 0  # left
            adjacent_indexes.push(index + 1) if col < 3  # right
            adjacent_indexes.push(index - 5) if row > 0 && col > 0  # top-left
            adjacent_indexes.push(index - 3) if row > 0 && col < 3 # top-right
            adjacent_indexes.push(index + 3) if row < 3 && col > 0  # bottom-left
            adjacent_indexes.push(index + 5) if row < 3 && col < 3  # bottom-right

            return adjacent_indexes
        end

        def can_form_word_from_index(board, index, word, used_indexes)
            # puts "Checking for \"#{word}\" from #{board[index]} at #{index}..."
            return true if word.length == 0

            # does the first letter match the current tile?
            return false unless board[index] == word[0] || board[index] == "*"

            # if it does, save it as traversed and check adjacents for next letter
            # need to create a new array so it doesn't get populated with the letters from failed paths
            new_used_indexes = used_indexes + [index]
            (get_adjacent_indexes(index) - new_used_indexes)
                .each do |adj_index|
                    # recursively check adjacent tiles for remaining letters
                    return true if can_form_word_from_index(board, adj_index, word[1..-1], new_used_indexes)
                end

            return false
        end
end
