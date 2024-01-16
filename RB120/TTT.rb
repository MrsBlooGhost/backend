=begin
Description:
  Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take turns marking a square. The first player to mark 3 squares in a row wins.

Step 6 - Break When Board is Full
=end
#-------------------Board----------------
require 'pry'

class Board
  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new } # key is sq num
  end

  def get_square_at(key) # key is sq num
    @squares[key] # key is sq num
  end

  def set_square_at(key, marker) # key is sq num
    @squares[key].marker = marker # key is sq num
  end

  def unmarked_keys # return array of integers representing unmarked squares
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end
end

#--------------------Square--------------
class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    @marker == INITIAL_MARKER
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
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    system 'clear'
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
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
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board.set_square_at(square, human.marker)
  end

  def computer_moves
    square = board.unmarked_keys.sample
    board.set_square_at(square, computer.marker)
  end

  def display_result
    display_board
    puts "The board is full!"
  end

  def play
    display_welcome_message
    display_board

    loop do
      human_moves
      break if board.full?
    #   break if someone_won? || board_full?

      computer_moves
      break if board.full?
      display_board
    #   break if someone_won? || board_full?
    end

    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play