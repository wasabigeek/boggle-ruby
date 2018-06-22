require "./helpers"

# get word to check from command line
word = ARGV.first
word = word.upcase

# convert board text file into a hash
board_file = open('board.txt', 'r')
board = board_file.read.split(", ")
board_file.close
# print board, "\n"

# check that word is valid
first_letter = word[0]
remaining_word = word[1..-1]

puts "Checking that \"#{word}\" can be formed..."
can_form_word = false
board.each_with_index do |tile, index|
    # find possible starts
    if tile == word[0] || tile == "*"
        can_form_word = check_next_letter(board, tile, index, remaining_word)
        break if can_form_word
    end
end

if can_form_word
    puts "#{word} can be formed!"
else
    puts "#{word} cannot be formed :("
end

# check that word is in dictionary