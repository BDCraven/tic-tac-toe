require './lib/tictactoe.rb'

game = TicTacToe.new


game.move("X", 1)
game.display_board
game.move("O", 2)
game.display_board
