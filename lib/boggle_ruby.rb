require "json"

require "./lib/boggle_ruby/version.rb"
require "./lib/game.rb"


module BoggleRuby
  def self.play
    game = Game.new()

    puts "How to play? Enter a word, or press CTRL-C to exit."
    game.board.print_board

    loop do
        puts "Your current score is #{game.score}. Enter a word:"

        print "> "
        word = $stdin.gets.chomp

        submit_word(word)
    end
  end
end
