require 'json'

require "./helpers"


dictionary = File.read("dictionary.txt").split("\n")
board = File.read("board.txt").split(", ")

# pre-check words that can be formed on the board
dictionary = dictionary.select {|word| check_word(board, word)}
File.write("valid_words.json", dictionary.to_json)
