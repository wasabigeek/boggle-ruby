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
        if found_words.include?(word)
            puts "You've already found #{word} :("
        elsif board.check_word(word)
            score += word.length
            found_words.push(word)
            puts "Found #{word}!"
        else
            puts "#{word} is not valid :("
        end
    end
end
