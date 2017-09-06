require './lib/tictactoe.rb'

game = TicTacToe.new


game.move("X", 1)
# game.display_board
# p game.board
# game.move("O", 9)
# game.display_board
p game.game_over?
# game.play
