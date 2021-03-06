require 'tictactoe'

describe TicTacToe do
  subject(:tictactoe) { described_class.new }

  it 'has an empty board array' do
    expect(tictactoe.board).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
  end

  describe '#display_board'
    it 'displays a 3 x 3 board' do
      expect { tictactoe.display_board }.to output("   |   |  \n-----------\n   |   |  \n-----------\n   |   |  \n").to_stdout
    end

  it 'has two players' do
    expect(tictactoe.player_one).to eq('X')
    expect(tictactoe.player_two).to eq('O')
  end

  describe '#move' do
    it { is_expected.to respond_to(:move).with(2).arguments }

    it 'adds the player to the selected field on the board' do
      board = ['X', 'O', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      tictactoe.move('X', 1)
      tictactoe.move('O', 2)
      tictactoe.move('X', 3)
      expect(tictactoe.board).to eq(board)
    end

    it 'prevents player from selecting a field that has already been chosen' do
      tictactoe.move('X', 1)
      expect(tictactoe.move('O', 1)).to eq('That field is not available. Please try again')
      expect(tictactoe.board[0]).to eq('X')
    end

    it 'prevents player from selecting a field that is outside the board' do
      expect(tictactoe.move('X', 0)).to eq('That field is not available. Please try again')
    end
  end

  describe '#turn' do
    it 'X has the first turn' do
      expect(tictactoe.turn).to eq('X')
    end

    it 'Y has the second turn after X claims a field' do
      tictactoe.move('X', 1)
      expect(tictactoe.turn).to eq('O')
    end
  end

  describe '#full?' do
    it 'confirms that the board is full' do
      tictactoe.move('X', 2)
      tictactoe.move('O', 1)
      tictactoe.move('X', 3)
      tictactoe.move('O', 5)
      tictactoe.move('X', 4)
      tictactoe.move('O', 6)
      tictactoe.move('X', 7)
      tictactoe.move('O', 8)
      tictactoe.move('X', 9)
      expect(tictactoe.full?).to be true
    end

    it 'confirms that the board is not full' do
      tictactoe.move('X', 2)
      tictactoe.move('O', 1)
      tictactoe.move('X', 3)
      tictactoe.move('O', 5)
      tictactoe.move('X', 4)
      tictactoe.move('O', 6)
      tictactoe.move('X', 7)
      tictactoe.move('O', 8)
      expect(tictactoe.full?).to be false
    end
  end

  describe '#win?' do
    it 'confirms if the game has a winning row' do
      tictactoe.move('X', 1)
      tictactoe.move('O', 4)
      tictactoe.move('X', 2)
      tictactoe.move('O', 5)
      tictactoe.move('X', 3)
      expect(tictactoe.win?).to be true
    end

    it 'confirms if the game has a winning column' do
      tictactoe.move('X', 1)
      tictactoe.move('O', 2)
      tictactoe.move('X', 4)
      tictactoe.move('O', 5)
      tictactoe.move('X', 7)
      expect(tictactoe.win?).to be true
    end

    it 'confirms the game is not a win' do
      tictactoe.move('X', 1)
      tictactoe.move('O', 2)
      tictactoe.move('X', 3)
      tictactoe.move('O', 5)
      tictactoe.move('X', 7)
      expect(tictactoe.win?).to be false
    end

    it 'confirms if the game has a winning diagonal' do
      tictactoe.move('X', 1)
      tictactoe.move('O', 2)
      tictactoe.move('X', 5)
      tictactoe.move('O', 6)
      tictactoe.move('X', 9)
      expect(tictactoe.win?).to be true
    end
  end

  describe '#game_over?' do
    it 'confirms the game is over if it is a win' do
      tictactoe.move('X', 1)
      tictactoe.move('O', 2)
      tictactoe.move('X', 5)
      tictactoe.move('O', 6)
      tictactoe.move('X', 9)
      expect(tictactoe.game_over?).to be true
    end

    it 'confirms the game is over if all fields are taken' do
      tictactoe.move('X', 2)
      tictactoe.move('O', 1)
      tictactoe.move('X', 3)
      tictactoe.move('O', 5)
      tictactoe.move('X', 4)
      tictactoe.move('O', 6)
      tictactoe.move('X', 7)
      tictactoe.move('O', 8)
      tictactoe.move('X', 9)
      expect(tictactoe.game_over?).to be true
    end

    it 'confirms the game is not over' do
      tictactoe.move('X', 1)
      tictactoe.move('O', 2)
      tictactoe.move('X', 3)
      tictactoe.move('O', 5)
      tictactoe.move('X', 7)
      expect(tictactoe.game_over?).to be false
    end

    it 'does not report game over with an empty board' do
      expect(tictactoe.game_over?).to be false
    end
  end
end
