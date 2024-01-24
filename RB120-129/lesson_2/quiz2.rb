# Question 1
# class Cat
#   attr_reader :name

#   @@total_cats = 0

#   def initialize(name)
#     @name = name
#     @@total_cats += 1
#   end

#   def jump
# 		"#{name} is jumping!"
# 	end

#   def self.total_cats
# 		@@total_cats
#   end

#   def to_s
#     @name
#   end
# end

# mitzi = Cat.new('Mitzi')
# mitzi.jump # => "Mitzi is jumping!"
# Cat.total_cats # => 1
# "The cat's name is #{mitzi}" # => "The cat's name is Mitzi"


# Question 2
# class Student
#   def initialize(name)
#     @name = name
#     @grade = nil
#   end
# end

# ade = Student.new('Adewale')
# p ade # => #<Student:0x00000002a88ef8 @name="Adewale", @grade=nil>


# Question 3
# class Student
#   # assume that this code includes an appropriate #initialize method
# end

# jon = Student.new('John', 22)  # instantiated with a name and an age
# jon.name # => 'John'  # getter :name
# jon.name = 'Jon'  # setter :name
# jon.grade = 'B'  # setter :grade
# jon.grade # => 'B'  # getter :grade


# Question 4
# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
# 		"#{name} is speaking."
# 	end
# end

# class Knight < Character
#   def name
# 		"Sir " + super
#   end
# end

# sir_gallant = Knight.new("Gallant")
# p sir_gallant.name # => "Sir Gallant"
# p sir_gallant.speak # => "Sir Gallant is speaking."


# Question 5
# class Character
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def speak
# 		"#{@name} is speaking."
# 	end
# end

# class Thief < Character
#   def speak
#     "#{name} is whispering..."
#   end
# end

# sneak = Thief.new("Sneak")
# p sneak.name # => "Sneak"
# p sneak.speak # => "Sneak is whispering..."


# Question 6
class FarmAnimal
  def speak
    "#{self.class} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow
  def self.speak
    super + "mooooooo!"
  end
end

p Sheep.new.speak # => "Sheep says baa!"
p Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
p Cow.new.speak # => "Cow says mooooooo!"
