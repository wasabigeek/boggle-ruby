require './lib/board/board.rb'


class Game
    attr_reader :started_at, :board

    def initialize
        @started_at = Time.now()
        @board = Board.new()
    end

    def submit_word(word)
        puts board.check_word(word)
    end

end
