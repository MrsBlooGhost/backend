# LS Man... Legend says LS Man first appeared in SPOT.
# Modify the code below so that we get the expected return values listed. You can only add code to the `Flightable` module and the `Superhero` class in order to get the expected outputs.

module Flightable
  def fly
    "I am a #{name}, I am a #{self.class.to_s.downcase}, and I can fly!"
  end
end

class Superhero
  include Flightable  
  
  attr_accessor :ability
  attr_reader :name
  
  def self.fight_crime
    hero = self.new
    hero.ability = Ability.new("coding skills").description

    puts "I am #{self}!"
    hero.announce_ability
  end
  
  def initialize(name=nil)
    @name = name
  end
  
  def announce_ability
    puts "I fight crime with my #{ability} ability!"
  end
end

class LSMan < Superhero; end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')

puts superman.fly # => I am Superman, I am a superhero, and I can fly!
LSMan.fight_crime # => I am LSMan!
                  # => I fight crime with my coding skills ability!