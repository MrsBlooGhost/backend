=begin
Description:
  Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns marking a square. The first player to mark 3 squares in a row wins.

Nouns: player, board, grid, square
Verbs: play, mark

Organized Nouns and Verbs:
Player
- play
- mark
Board
Square
=end

class Board
  def initialize
    # some way of modeling a 3x3 grid
	end
end

class Square
  def initialize
    # a status to keep track of this Square's mark?
	end
end

class Player
  def initialize
    # a marker to keep track of this Player's symbol (i.e. 'X' or 'O')
	end

  def mark
	end
end

class TTTGame
  def play
    display_welcome_message
    loop do
      display_board
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play