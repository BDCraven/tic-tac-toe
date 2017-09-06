class TicTacToe
  attr_reader :board, :player_one, :player_two

  def initialize
    @board = [' ', ' ', ' ',
              ' ', ' ', ' ',
              ' ', ' ', ' ']
    @player_one = 'X'
    @player_two = 'O'
    @turn = 1
  end

  def display_board
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "----------"
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "----------"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end

  def move(player, position)
    if board[position -1] == ' ' && (position-1).between?(0,10)
      board[position -1] = player
      @turn += 1
    else
      p 'That field is not available. Please try again'
    end
  end

  def turn
    @turn.odd? ? player_one : player_two
  end

  def full?
    !@board.include?(' ') ? true : false
  end

end
