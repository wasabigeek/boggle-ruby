require "json"

require "./lib/boggle_ruby/version.rb"


module BoggleRuby
  def self.play
    # get valid words
    valid_words = JSON.parse(File.read('valid_words.json'))
    puts "How to play? Enter a word, or press CTRL-C to exit."

    puts "Here's the board:"
    board = File.read('board.txt').split(", ")
    board.each_with_index {|tile, index|
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
        elsif valid_words.include?(word)
            score += word.length
            found_words.push(word)
            puts "Found #{word}!"
        else
            puts "#{word} is not valid :("
        end
    end
  end
end
