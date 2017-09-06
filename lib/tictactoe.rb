class TicTacToe
  attr_reader :board, :player_one, :player_two

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    @board = [' ', ' ', ' ',
              ' ', ' ', ' ',
              ' ', ' ', ' ']
    @player_one = 'X'
    @player_two = 'O'
    @turn_count = 1
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
      @turn_count += 1
    else
      p 'That field is not available. Please try again'
    end
  end

  def turn
    @turn_count.odd? ? player_one : player_two
  end

  def full?
    !@board.include?(' ') ? true : false
  end

  def win?
    WIN_COMBINATIONS.each do |i, j, k|
      return true if board[i] == board[j] && board[i] == board[k]
    end
    false
  end

end
