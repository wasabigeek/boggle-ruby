require "./helpers"

# get word to check from command line
word = ARGV.first

# convert board text file into a hash
board_file = open('board.txt', 'r')
board = board_file.read.split(", ")
board_file.close
# print board, "\n"

# check that word is valid
puts "Checking that \"#{word}\" can be formed..."
can_form_word = check_word(board, word)

if can_form_word
    puts "#{word} can be formed!"
else
    puts "#{word} cannot be formed :("
end

# check that word is in dictionary