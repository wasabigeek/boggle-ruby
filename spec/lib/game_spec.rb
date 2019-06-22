require './lib/board/board_factory.rb'
require "./lib/game.rb"


describe Game do
  describe '#submit_word' do
    let(:board) { instance_double('Board', check_word: true) }

    context 'when game time has ended' do
      # each game should last only 2 mins
      let(:game) { Game.new(started_at: Time.now - (60 * 2 + 1), board: board) }

      it 'prints time out text' do
        expect_any_instance_of(Kernel).to receive(:puts).with("Time out!")
        game.submit_word('blah')
      end
    end

    context 'when word is already found' do
      let(:game) { Game.new(found_words: [Word.new('shake')], board: board) }

      it 'prints that word is already found' do
        expect_any_instance_of(Kernel).to receive(:puts).with("You've already found SHAKE :(")
        game.submit_word('shake')
      end
    end

    context 'when word exists on board' do
      let(:game) { Game.new(board: board) }

      it 'prints that word is found' do
        expect_any_instance_of(Kernel).to receive(:puts).with("Found SHAKE!")
        game.submit_word('shake')
      end
    end

    context 'when word is invalid' do
      let(:board) { instance_double('Board', check_word: false) }
      let(:game) { Game.new(board: board) }

      it 'prints that word is invalid' do
        expect_any_instance_of(Kernel).to receive(:puts).with("SHAKE is not valid :(")
        game.submit_word('shake')
      end
    end

    context 'integration test' do
      let(:initial_letters) { open('board.txt', 'r') { |file| file.read.split(', ') } }
      let(:board) { BoardFactory.build(initial_letters: initial_letters) }
      let(:game) { Game.new(board: board) }

      it 'prints that word is found' do
        expect_any_instance_of(Kernel).to receive(:puts).with("Found TAP!")
        game.submit_word('tap')
      end
    end
  end
end
