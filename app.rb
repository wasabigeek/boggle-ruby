# get word to check from command line
word = ARGV.first
word = word.upcase

puts word

# convert board text file into a hash
board_file = open('board.txt', 'r')
board = board_file.read.split(", ")
board_file.close

print board, "\n"
puts word[0]

# check that word is valid
puts "Checking that word is valid..."
board.each_with_index do |tile, index|
    # find possible starts
    if tile == word[0] || tile == "*"
        puts tile
    end
end

# check that word is in dictionary