# LS Man... Legend says LS Man first appeared in SPOT.
# Modify the code below, using the below criteria, so that we get the expected return values. 

  module Flightable
    def fly
      "I am #{name}, I am a #{self.class.to_s.downcase}, and I can fly!"
    end
  end
  
  class Superhero
    include Flightable

    attr_accessor :ability
    attr_reader :name
    
    def self.fight_crime
      puts "I am #{self}!"
      self.new.announce_ability
    end
    
    def initialize(name)
      @name = name
    end
    
    def announce_ability
      puts "I fight crime with my #{ability.description} ability!"
    end
  end
  
  class LSMan < Superhero
    def initialize
      @ability = Ability.new("coding skills")
    end
  end
  
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