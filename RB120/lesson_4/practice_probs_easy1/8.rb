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

# In the `self.cats_count` method, `self` in this context, refers to the class,
# `Cat`.

p Cat.cats_count  # => 0
Cat.new("jaguar")
p Cat.cats_count   # => 1