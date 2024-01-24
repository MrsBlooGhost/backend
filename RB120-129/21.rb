=begin
Description of problem:
Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

  Overview of game:
  - Both participants are initially dealt 2 cards from a 52-card deck.
  - The player takes the first turn, choosing to "hit" or "stay".
    - If the player busts, he loses. If he stays, it's the dealer's turn.
  - The dealer takes a turn, choosing to "hit" until his cards add up to at least 17.
    - If the dealer busts, the player wins.
    - If both the player and the dealer choose to "stay", the participant with the highest total score wins.
      - If both total scores are equal, it's a tie.

Nouns: card, participant, user, dealer, game, total score
Verbs: deal, hit, stay, busts

Organized Nouns and Verbs:
Participant
Player
- hit
- stay
- busted?
- total score
Dealer
- hit
- stay
- busted?
- total score
- deal (should this be here, or in Deck?)
Deck
- deal (should this be here, or in Dealer?)
Card
Game
- start
=end

class Participant
end

class Player
  def initialize
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Dealer
  def initialize
  end

  def deal
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Deck
  def initialize
  end

  def deal
  end
end

class Card
  def initialize
  end
end

class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start