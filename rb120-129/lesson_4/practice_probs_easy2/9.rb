class Game
  def play
		"Start the game!"
	end
end

class Bingo < Game
  def rules_of_play
		#rules of play
  end

  def play
    "Playing Bingo"
  end
end

p Bingo.new.play