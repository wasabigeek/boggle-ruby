require './lib/board/board.rb'


class Game
    attr_reader :started_at, :board
    attr_accessor :score, :found_words

    def initialize
        @started_at = Time.now()
        @board = Board.new()
        @score = 0
        @found_words = []
    end

    def submit_word(word)
        if time_out?
            puts "Time out!"
        elsif found_words.include?(word)
            puts "You've already found #{word} :("
        elsif board.check_word(word)
            self.score += word.length
            self.found_words.push(word)
            puts "Found #{word}!"
        else
            puts "#{word} is not valid :("
        end
    end

    private

        def time_out?
            started_at < Time.now - (60 * 2) ? true : false
        end
end
