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
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts "----------"
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end

  def move(player, position)
    if board[position -1] == ' ' && (position-1).between?(0,10)
      board[position -1] = player
    else
      p 'That field is not available. Please try again'
    end
  end

end
