class TicTacToe
  attr_reader :board

  def initialize
    @board = [' ', ' ', ' ',
              ' ', ' ', ' ',
              ' ', ' ', ' ']
  end

  def display_board
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts "----------"
    puts "#{board[4]} | #{board[5]} | #{board[6]}"
    puts "----------"
    puts "#{board[7]} | #{board[8]} | #{board[9]}"
  end

  def move(player, position)
    if board[position -1] == ' '
      board[position -1] = player
    else
      p 'That field is not available. Please try again'
    end
  end

end
