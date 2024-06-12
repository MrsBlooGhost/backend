class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
		@@cats_count
  end
end

# The `@@cats_count` variable is a class variable. It is initialized with the
# instantiation of an object from the `Cat` class. And with each instantiation
# of a `Cat` class object, the class variable is incremented by 1. We can then
# return the integer referenced by `@@cats_count` by calling the class method
# `cats_count`. The `@@cats_count` variable keeps track of how many instances
# of the `Cat` class has been created. 

p Cat.cats_count  # => 0
Cat.new("tiger")

p Cat.cats_count  # => 1