require './lib/board/board.rb'
require './lib/word.rb'


class Game
    attr_reader :started_at, :board
    attr_accessor :found_words

    def initialize(
      started_at: Time.now,
      board: BoardFactory.build,
      found_words: []
    )
      @started_at = started_at
      @board = board
      @score = Score.new
      @found_words = found_words
    end

    def submit_word(raw_string)
        word = Word.new(raw_string)

        if time_out?
            puts "Time out!"
            return
        end

        if found_words.include?(word)
            puts "You've already found #{word} :("
            return
        end

        if board.check_word(word)
            @score.add(word)
            found_words.push(word)
            puts "Found #{word}!"
            return
        end

        puts "#{word} is not valid :("
    end

    def get_score
        @score.total
    end

    def print_board_to_console
      board.print_to_console
    end

    private

        def time_out?
            started_at < Time.now - (60 * 2) ? true : false
        end
end


class Score
  def initialize
    @value = 0
  end

  def add(word)
    @value += word.length
  end

  def total
    @value
  end
end
