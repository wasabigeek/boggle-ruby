require './lib/board/board.rb'
require './lib/board/tile.rb'
require './lib/board/word_finder.rb'


class BoardFactory
  # @param initial_letters [Array<String>] - an array of letters, each representing a tile
  def self.build(initial_letters: [], word_finder: WordFinder)
    letter_array = initial_letters
    if letter_array.empty?
      letter_array = generate_random_board
    end

    board = Board.new(tiles: create_tile_objects_from_array(letter_array))
    valid_words = word_finder.new(board).generate_valid_words
    board.valid_words = valid_words

    board
  end

  private

  def self.generate_random_board
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
    dice.map do |sides|
      sides[Random.new.rand(6)]
    end
  end

  # @param letter_array [Array<String>] - an array of letters, each representing a tile
  def self.create_tile_objects_from_array(letter_array)
    letter_array.each_with_index.map { |letter, position| Tile.new(letter, position) }
  end
end
