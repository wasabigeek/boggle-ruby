require "./lib/board/board_factory.rb"
require "./lib/board/word_finder.rb"
require "./lib/word.rb"


describe WordFinder do
  let(:initial_letters) { open('board.txt', 'r') { |file| file.read.split(', ') } }
  let(:board) {
    Board.new(
      # ugh. should this be a public method if it only helps with the test setup
      tiles: BoardFactory.send(:create_tile_objects_from_array, initial_letters)
    )
  }
  let(:word_finder) { WordFinder.new(board) }

  it 'handles words needing horizontal traversal' do
    expect(
      word_finder.find_word(Word.new("TAP"))
    ).to eq true
  end

  it 'handles words needing an asterisk' do
    expect(
      word_finder.find_word(Word.new("BOSS"))
    ).to eq true
  end

  it 'handles words needing diagonal traversal' do
    expect(
      word_finder.find_word(Word.new("BEAK"))
    ).to eq true
    expect(
      word_finder.find_word(Word.new("BOAR"))
    ).to eq true
    expect(
      word_finder.find_word(Word.new("BIRD"))
    ).to eq true
  end

  it 'returns false if letters are not adjacent' do
    expect(
      word_finder.find_word(Word.new("DATE"))
    ).to eq false
    # this case can pass if reverse traversal is allowed
    expect(
      word_finder.find_word(Word.new("BOSSDOM"))
    ).to eq false
  end
end
