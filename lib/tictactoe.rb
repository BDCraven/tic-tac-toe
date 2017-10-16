# controls the entire logic for a game of Tic-Tac-Toe
class TicTacToe
  attr_reader :board, :player_one, :player_two

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def initialize
    @board = [' ', ' ', ' ',
              ' ', ' ', ' ',
              ' ', ' ', ' ']
    @player_one = 'X'
    @player_two = 'O'
    @turn_count = 1
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]}"
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]}"
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]}"
  end

  def move(player, position)
    if board[position - 1] == ' ' && (position - 1).between?(0, 10)
      board[position - 1] = player
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
    WIN_COMBINATIONS.each do |field1, field2, field3|
      return true if claimed?(field1) && identical?(field1, field2, field3)
    end
    false
  end

  def game_over?
    return true if win? || full?
    false
  end

  def play
    until game_over?
      puts "Player #{turn}: Please enter a number: 1-9"
      display_board
      input = gets.chomp.to_i
      move(turn, input)
    end
    display_board
  end

  private

  def claimed?(field1)
    board[field1] == 'X' || board[field1] == 'O'
  end

  def identical?(field1, field2, field3)
    board[field1] == board[field2] && board[field1] == board[field3]
  end
end
