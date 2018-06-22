require "json"


# get valid words
valid_words = JSON.parse(File.read('valid_words.json'))
puts "How to play? Enter a word, or press CTRL-C to exit."

puts "Here's the board:"
board = File.read('board.txt').split(", ")
board.each_with_index {|tile, index|
    print "#{tile} #{"\n"if index % 4 == 3}"
}

score = 0
loop do
    puts "Your current score is #{score}. Enter a word:"
    print "> "
    # get user's input
    word = $stdin.gets.chomp
    if valid_words.include?(word)
        score += word.length
        puts "Found #{word}!"
    else
        puts "#{word} is not valid :("
    end
end
