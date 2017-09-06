require 'tictactoe'

describe TicTacToe do
  subject(:tictactoe) { described_class.new }

  it 'has a an empty board array' do
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

  end
end
