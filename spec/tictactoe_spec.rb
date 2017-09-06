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
  end
