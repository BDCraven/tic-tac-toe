require 'tictactoe'

describe TicTacToe do
  subject(:tictactoe) { described_class.new }

  it 'has an empty board array' do
    expect(tictactoe.board).to eq([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
  end

  # describe '#display_board'
  #   it 'displays a 3 x 3 board' do
  #     board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  #     expect{ tictactoe.display_board }.to output(%Q{
  #     "#{board[0]} | #{board[1]} | #{board[2]}"
  #     "----------"
  #     "#{board[3]} | #{board[4]} | #{board[5]}"
  #     "----------"
  #     "#{board[6]} | #{board[7]} | #{board[8]}"
  #     }).to_stdout
  #   end

  it 'has two players' do
    expect(tictactoe.player_one).to eq('X')
    expect(tictactoe.player_two).to eq('O')
  end

  describe '#move' do
    it { is_expected.to respond_to(:move).with(2).arguments }

    it 'adds the player to the selected field on the board' do
      board = ['X', 'O', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      tictactoe.move("X", 1)
      tictactoe.move("O", 2)
      tictactoe.move("X", 3)
      expect(tictactoe.board).to eq(board)
    end

    it 'prevents player from selecting a field that has already been chosen' do
      tictactoe.move("X", 1)
      expect(tictactoe.move("O", 1)).to eq('That field is not available. Please try again')
      expect(tictactoe.board[0]).to eq('X')
    end

    it 'prevents player from selecting a field that is outside the board' do
      expect(tictactoe.move("X", 0)).to eq('That field is not available. Please try again')
    end

  end

  describe '#turn' do
    it 'X has the first turn' do
      expect(tictactoe.turn).to eq("X")
    end

    it 'Y has the second turn after X claims a field' do
      tictactoe.move('X', 1)
      expect(tictactoe.turn).to eq("O")
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
      # @board = ['O', 'X', 'X', 'X', 'O', 'O', 'X', 'O', 'X']
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
end
