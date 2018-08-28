require "json"

require "./lib/boggle_ruby/version.rb"
require "./lib/game.rb"


module BoggleRuby
  def self.play
    game = Game.new()
    # print game.board.tiles
    # print game.board.valid_words
    # w = game.board.valid_words.first

    # puts game.submit_word(w)
    # puts game.submit_word("asldfjasldfkjasdl")

    puts "How to play? Enter a word, or press CTRL-C to exit."

    puts "Here's the board:"
    game.board.tiles.each_with_index {|tile, index|
        print "#{tile} #{"\n"if index % 4 == 3}"
    }

    score = 0
    found_words = []
    loop do
        puts "Your current score is #{score}. Enter a word:"
        print "> "
        # get user's input
        word = $stdin.gets.chomp
        if found_words.include?(word)
            puts "You've already found #{word} :("
        elsif game.board.valid_words.include?(word)
            score += word.length
            found_words.push(word)
            puts "Found #{word}!"
        else
            puts "#{word} is not valid :("
        end
    end
  end
end
