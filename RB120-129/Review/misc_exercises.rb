# From Joseph Ochoa

# Give class `Barbarian` the functionality of the instance method `attack` in `Monster` in three ways:

# By using class inheritance

class Monster
  def attack
    "attacks from superclass!"
  end
end

class Barbarian < Monster
end

Barbarian.new.attack # => "attacks from superclass!"

# By using modules

module Attackable
  def attack
    "attacks from module!"
  end
end

class Monster
  include Attackable
end

class Barbarian
  include Attackable
end

Barbarian.new.attack # => "attacks from module!"

# By using duck typing

class Monster
  def attack
    "attacks from Monster!"
  end
end

class Barbarian
  def attack
    "attacks from Barbarian!"
  end
end

[Monster.new, Barbarian.new].each { |inst| puts inst.attack }
# Output:
# attacks from Monster!
# attacks from Barbarian!