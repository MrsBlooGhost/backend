=begin
Description:
  Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns marking a square. The first player to mark 3 squares in a row wins.

Step 3 - Human Moves
=end

#-------------------Board----------------
require 'pry'

class Board
  INITIAL_MARKER = ' '

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new(INITIAL_MARKER) } # key is sq num
  end

  def get_square_at(key) # key is sq num
    @squares[key] # key is sq num
  end

  def set_square_at(key, marker) # key is sq num
    @squares[key].marker = marker # key is sq num
  end
end

#--------------------Square--------------
class Square
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
  end

  def to_s
    @marker
  end
end

#--------------------Player--------------
class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

#--------Game Orchestration Engine--------
class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new('X')
    @computer = Player.new('O')
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

  def human_moves
    puts "Choose a square between 1-9: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if (1..9).include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board.set_square_at(square, human.marker)
  end

  def play
    display_welcome_message
    # loop do
       display_board
       human_moves
       display_board
    #   break if someone_won? || board_full?

       computer_moves
    #   break if someone_won? || board_full?
    # end
    # display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play