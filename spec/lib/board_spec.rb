require "./lib/board/board.rb"


describe Board do
    let(:tiles) { open('board.txt', 'r') { |file| file.read.split(', ') } }
    let(:board) { Board.new(tiles: tiles) }

    it 'handles words needing horizontal traversal' do
        expect(board.find_word("TAP")).to eq true
    end

    it 'handles words needing an asterisk' do
        expect(board.find_word("BOSS")).to eq true
    end

    it 'handles words needing diagonal traversal' do
        expect(board.find_word("BEAK")).to eq true
        expect(board.find_word("BOAR")).to eq true
        expect(board.find_word("BIRD")).to eq true
    end

    it 'returns false if letters are not adjacent' do
        expect(board.find_word("DATE")).to eq false
        # this case can pass if reverse traversal is allowed
        expect(board.find_word("BOSSDOM")).to eq false
    end
end
