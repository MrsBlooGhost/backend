=begin
Description:
  Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns marking a square. The first player to mark 3 squares in a row wins.

Step 2 - Set up `Board` and `Square` classes
=end

#-------------------Board----------------
class Board
  INITIAL_MARKER = ' '

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new(INITIAL_MARKER) }
  end

  def get_square_at(key)
    @squares[key]
  end
end

#--------------------Square--------------
class Square
  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end

#--------------------Player--------------
class Player
  def initialize
    # a marker to keep track of this Player's symbol (i.e. 'X' or 'O')
  end

  def mark
  end
end

#--------Game Orchestration Engine--------
class TTTGame
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
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