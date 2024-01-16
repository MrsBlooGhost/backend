=begin
Description:
  Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns marking a square. The first player to mark 3 squares in a row wins.

Step 1 - Display a board
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
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "     |     |"
    puts "  X  |     |"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "     |     |  X"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "     |     |"
    puts "     |     |"
    puts
  end

  def play
    display_welcome_message
    # loop do
       display_board
    #   first_player_moves
    #   break if someone_won? || board_full?

    #   second_player_moves
    #   break if someone_won? || board_full?
    # end
    # display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play