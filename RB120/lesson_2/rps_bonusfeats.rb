class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  GAME_LOGIC =
    {
      'rock' => ['lizard', 'scissors'],
      'scissors' => ['paper', 'lizard'],
      'paper' => ['rock', 'spock'],
      'lizard' => ['spock', 'paper'],
      'spock' => ['rock', 'scissors']
    }

  def initialize(value)
    @value = value
  end

  def >(other_move)
    GAME_LOGIC[value].include?(other_move.value)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def increment_score
    self.score += 1
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a name."
    end
    puts
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  PERSONALITIES =
    {
      'R2D2' => ['rock'],
      'Hal' => ['scissors', 'scissors', 'scissors', 'rock'],
      'Chappie' => ['paper', 'lizard'],
      'Sonny' => ['paper', 'lizard', 'spock', 'spock'],
      'Number 5' => ['rock', 'lizard', 'lizard', 'spock']
    }

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(PERSONALITIES[name].sample)
  end
end

class RPSGame
  attr_accessor :human, :computer, :round, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @round = 1
    @history = {}
  end

  def display_welcome
    puts "Welcome to Rock, Paper, Scissors! The first player to 10 points wins."
    puts
  end

  def display_goodbye
    puts "Thanks for playing Rock, Paper, Scissors! Goodbye."
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won the round!"
    elsif computer.move > human.move
      puts "#{computer.name} won the round!"
    else
      puts "The round results in a tie!"
    end
    puts
  end

  def update_history
    history[round] = [human.move.to_s, computer.move.to_s]
  end

  def display_history
    history.each do |round, move|
      puts "Round #{round}: #{human.name} chose #{move[0]}, #{computer.name} chose #{move[1]}."
    end
  end

  def increment_round
    self.round += 1
  end

  def update_score
    if human.move > computer.move
      human.increment_score
    elsif computer.move > human.move
      computer.increment_score
    end
  end

  def display_score
    puts "#{human.name}'s score: #{human.score}"
    puts "#{computer.name}'s score: #{computer.score}"
    puts
  end

  def game_winner?
    human.score >= 10 || computer.score >= 10
  end

  def display_game_winner
    puts "#{human.name} has won the game!" if human.score == 10
    puts "#{computer.name} has won the game!" if computer.score == 10
  end

  def play
    display_welcome
    loop do
      human.choose
      computer.choose
      puts
      update_history
      display_history
      increment_round
      display_round_winner
      update_score
      display_score
      break if game_winner?
    end
    display_game_winner
    display_goodbye
  end
end

RPSGame.new.play
