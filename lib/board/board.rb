require 'json'

require './lib/word.rb'
require './lib/board/tile.rb'
require './lib/board/board_factory.rb'
require './lib/board/word_finder.rb'


class Board
  attr_reader :tiles
  attr_writer :valid_words

  def initialize(tiles:, valid_words: [])
    @tiles = tiles
    @valid_words = valid_words
  end

  # check if word is in valid list, which is lazily generated
  # @param word [Word]
  def check_word(word)
    valid_words.include?(word)
  end

  def print_to_console
    puts "Here's the board:"
    tiles.each(&:print_to_console)
  end

  # Retrieves the tiles that are adjacent to param tile
  # @param tile [Tile]
  # @returns Array<Tile>
  def get_adjacent_tiles(tile)
    positions = tile.get_adjacent_positions

    tiles.select { |tile| positions.include? tile.position }
  end

  def any_tile?
    tiles.any? { |tile| yield(tile) }
  end

  private

  attr_reader :valid_words
end
