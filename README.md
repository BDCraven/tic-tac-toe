## Tic-Tac-Toe

### The brief

A one day tech test to build the business logic for a game of tic tac toe. It should be easy to implement a working game of tic tac toe by combining the code with any user interface, whether web or command line.

The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken


### Tech

Written in Ruby and tested with RSpec.


### How to use

1. `git clone https://github.com/BDCraven/tic-tac-toe.git`
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`
4. Run the tests by typing rspec in the command line.

### User interface

To test how easily the code could be combined with a user interface I included a play method which allows a basic version of the game to be run in irb:

````

2.4.0 :001 > require './lib/tictactoe.rb'
 => true

2.4.0 :002 > game = TicTacToe.new
 => #<TicTacToe:0x007fb24694f6d8
 @board=[" ", " ", " ", " ", " ", " ", " ", " ", " "],
 @player_one="X", @player_two="O", @turn_count=1>

2.4.0 :003 > game.play
Player X: Please enter a number: 1-9
   |   |
-----------
   |   |
-----------
   |   |
1
Player O: Please enter a number: 1-9
 X |   |
-----------
   |   |
-----------
   |   |

````
