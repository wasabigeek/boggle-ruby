require "json"


# get word to check from command line
if not ARGV.first
    puts "Please enter a word.\nExpected format: ruby app.rb <word>"
    exit
end
word = ARGV.first

# get valid words
valid_words = JSON.parse(File.read('valid_words.json'))

# check that word is valid
puts "Checking that \"#{word}\" is valid..."
if valid_words.include?(word)
    puts "#{word} can be formed!"
else
    puts "#{word} cannot be formed :("
end
