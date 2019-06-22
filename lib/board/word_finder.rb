require './lib/board/word_finder'


class WordFinder
  def initialize(board)
    @board = board
  end

  # checks if word is in board via brute force
  def find_word(word)
    board.any_tile? do |tile|
      can_form_word_from_tile(tile, word)
    end
  end

  def generate_valid_words
    dictionary = File.read("lib/board/dictionary.txt").split("\n")
    valid_words = dictionary
      .map { |raw_string| Word.new(raw_string) }
      .select { |word| find_word(word) }
  end

  private

  attr_reader :board

  def can_form_word_from_tile(tile, word, used_tiles: [])
    # if the word is empty, we've successfully matched the final letter
    return true if word.length == 0

    # does the first letter match the current tile?
    # if not, this path is invalid, exit early
    return false unless tile.matches(word.first_letter)

    # remember the current tile so we don't traverse backwards
    # need to create a new array so we don't retain the letters from failed paths
    temp_used_tiles = used_tiles + [ tile ]
    # recursively check adjacent tiles for remaining letters
    (board.get_adjacent_tiles(tile) - used_tiles).any? do |adjacent_tile|
      can_form_word_from_tile(
        adjacent_tile,
        word.second_letter_onwards,
        used_tiles: temp_used_tiles
      )
    end
  end
end
